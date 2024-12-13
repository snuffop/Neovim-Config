--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- OIL
function _G.get_oil_winbar()
  local dir = require("oil").get_current_dir()
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {

    ---@module 'oil'
    {
        "stevearc/oil.nvim",
        dependencies = {
            {
                "echasnovski/mini.icons",
                opts = {},
            },
        },
        cmd = "Oil",

        ---@type oil.SetupOpts
        opts = {
            default_file_explorer = true,
            restore_win_options = true,
            delete_to_trash = true,
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
                -- This function defines what is considered a "hidden" file
                is_hidden_file = function(name, bufnr)
                    return vim.startswith(name, ".")
                end,
                -- This function defines what will never be shown, even when `show_hidden` is set
                is_always_hidden = function(name, bufnr)
                    return false
                end,
            },
            float = {
                -- Padding around the floating window
                padding = 2,
                max_width = 0,
                max_height = 0,
                border = "rounded",
                win_options = {
                    winblend = 10,
                },
                preview_split = "auto",
                override = function(conf)
                    return conf
                end,
            },
            win_options = {
                signcolumn = "yes:2",
                statuscolumn = "",
                winbar = "%!v:lua.get_oil_winbar()",
            },
            keymaps = {
                ["gd"] = {
                    desc = "Toggle file detail view",
                    callback = function()
                        detail = not detail
                        if detail then
                            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                        else
                            require("oil").set_columns({ "icon" })
                        end
                    end,
                },
                ["g?"]    = { "actions.show_help", mode = "n" },
                ["<CR>"]  = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                ["<C-t>"] = { "actions.select", opts = { tab = true } },
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["<C-l>"] = "actions.refresh",
                ["-"]     = { "actions.parent", mode = "n" },
                ["_"]     = { "actions.open_cwd", mode = "n" },
                ["`"]     = { "actions.cd", mode = "n" },
                ["~"]     = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                ["gs"]    = { "actions.change_sort", mode = "n" },
                ["gx"]    = "actions.open_external",
                ["g."]    = { "actions.toggle_hidden", mode = "n" },
                ["g\\"]   = { "actions.toggle_trash", mode = "n" },
            },
        }
    },

    ---@module 'fuzzy-oil'
    {
        'p10/fuzzy-oil.nvim',
        dependencies = { 'stevearc/oil.nvim', 'nvim-telescope/telescope.nvim' },
        cmd = 'FuzzyOil',
        opts = {},
    },

    ---@module 'oil-git-status'
    {
        "refractalize/oil-git-status.nvim",
        dependencies = {
            "stevearc/oil.nvim",
        },
        config = function()
            require("oil").setup({
                win_options = {
                    signcolumn = "yes:2",
                },
            })
        end,
    },

    ---@module 'oil-git-signs'
    {
        "FerretDetective/oil-git-signs.nvim",
        ft = "oil",
        opts = {},
    }

}
