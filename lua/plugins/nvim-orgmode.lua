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
                rg_agenda_files = "~/Nextcloud/Org/**/*",
                org_default_notes_file = "~/Nextcloud/Org/Orgzly/Inbox.org",
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
        ft = { "org" },
        config = function()
            require('org-bullets').setup()
        end
    },
}
