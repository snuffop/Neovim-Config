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
                org_agenda_files = "~/Nextcloud/Org/Orgzly/*",
                org_default_notes_file = "~/Nextcloud/Org/Orgzly/Inbox.org",
                org_todo_keywords = {'TODO(t)', 'STARTED(s)', 'WAITING(w)', 'DELEGATED', '|', 'ASSIGNED', 'CANCELLED(c)', 'DONE(d)' },
                org_todo_keyword_faces = {
                    TODO = ':foreground "red"     :weight bold',
                    STARTED    = ':foreground "#E35DBF" :weight bold',
                    WAITING    = ':foreground "#008080" :weight bold',
                    WAIT       = ':foreground "#008080" :weight bold',
                    DELEGATED  = ':foreground "pink"    :weight bold',
                    CANCELLED  = ':foreground "white"   :weight bold',
                    ASSIGNED   = ':foreground "white"   :weight bold',
                    DONE       = ':foreground "green"   :weight bold',
                },
                org_log_into_drawer = "LOGBOOK",
                emacs_config = "~/.config/doom/init.el",
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
