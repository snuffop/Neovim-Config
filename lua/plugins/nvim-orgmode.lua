--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return{
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })
            -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
            -- add ~org~ to ignore_install
            require('nvim-treesitter.configs').setup({
                ensure_installed = 'all',
                ignore_install = { 'org' },
            })
        end,
    },

    {
        'akinsho/org-bullets.nvim', 
        config = function()
            require('org-bullets').setup()
        end
    },

    -- {
    --     "nvim-orgmode/telescope-orgmode.nvim",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "nvim-orgmode/orgmode",
    --         "nvim-telescope/telescope.nvim",
    --     },
    --     config = function()
    --         require("telescope").load_extension("orgmode")
    --
    --         vim.keymap.set("n", "<leader>oR", require("telescope").extensions.orgmode.refile_heading)
    --         vim.keymap.set("n", "<leader>ofh", require("telescope").extensions.orgmode.search_headings)
    --         vim.keymap.set("n", "<leader>oli", require("telescope").extensions.orgmode.insert_link)
    --     end,
    -- }
}
