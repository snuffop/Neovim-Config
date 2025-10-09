--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- lua/plugins/obsidian.lua
return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = { "markdown", "markdown.mdx" },
        cmd = {
            "Obsidian",
        },
        opts = {
            workspaces = {
                { name = "default", path = "~/Obsidian/default" },
            },
            notes_subdir = nil, -- keep flat unless you want subfolders
            daily_notes = {
                folder = "Journal",
                date_format = "%Y-%m-%d",
            },
            templates = {
                folder = "Templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
                substitutions = {},
            },
            completion = { nvim_cmp = false },
            ui = { enable = true },
            --picker = { name = "snacks.picker" },
            preferred_link_style = "markdown",
            disable_frontmatter = false,
            follow_url_func = function(url) vim.ui.open(url) end,
            -- Obsidian 3.14 in-process LSP
            lsp = { enable = true, formatting = false },

            note_id_func = function(title)
                local t = (title or "untitled")
                    :gsub("[^%w%s%-_]", "")   -- strip weird chars
                    :gsub("%s+", "-")         -- spaces -> dashes
                return os.date("%Y%m%d%H%M%S") .. "--" .. t
            end,
            note_path_func = function(spec)
                if spec.type == "daily" then
                    return ("Journal/%s.md"):format(spec.id)
                else
                    return ("Resources/%s.md"):format(spec.id)
                end
            end,
        },
        keys = {
            { "<leader>on", "<cmd>Obsidian new<CR>",           desc = "Obsidian: New note" },
            { "<leader>oo", "<cmd>Obsidian quick_switch<CR>",  desc = "Obsidian: Quick switch" },
            { "<leader>os", "<cmd>Obsidian search<CR>",        desc = "Obsidian: Search" },
            { "<leader>oB", "<cmd>Obsidian backlinks<CR>",     desc = "Obsidian: Backlinks" },
            { "<leader>ol", "<cmd>Obsidian link<CR>",          desc = "Obsidian: Link selection" },
            { "<leader>oT", "<cmd>Obsidian template<CR>",      desc = "Obsidian: Insert template" },

            { "<leader>odd", "<cmd>Obsidian dailies<CR>",      desc = "Obsidian: dailies (daily)" },
            { "<leader>odt", "<cmd>Obsidian today<CR>",        desc = "Obsidian: Today (daily)" },
            { "<leader>odT", "<cmd>Obsidian tomorrow<CR>",     desc = "Obsidian: Tomorrow (daily)" },
            { "<leader>ody", "<cmd>Obsidian yesterday<CR>",    desc = "Obsidian: Yesterday (daily)" },

            -- LSP-powered nav
            { "gd", function() vim.lsp.buf.definition() end,    desc = "Follow link / definition" },
            { "gr", function() vim.lsp.buf.references() end,    desc = "Backlinks (references)" },
            { "<leader>or", function() vim.lsp.buf.rename() end, desc = "Rename note (LSP)" },

            -- Normal-mode Ctrl-Shift-I to insert an Obsidian link
            { "<C-S-i>", "<cmd>Obsidian links<CR>", mode = "i", desc = "Insert Obsidian link" },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("md_ux", { clear = true }),
                pattern = { "markdown", "markdown.mdx" },
                callback = function()
                    vim.opt_local.conceallevel = 2
                    vim.opt_local.wrap = true
                    vim.opt_local.spell = false
                end,
            })
        end,
    },
}
