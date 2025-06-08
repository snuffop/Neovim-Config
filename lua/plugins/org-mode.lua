--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {

    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    dependencies = {
        "danilshvalov/org-modern.nvim",
        'nvim-telescope/telescope.nvim',
        'nvim-orgmode/telescope-orgmode.nvim',
        'nvim-orgmode/org-bullets.nvim',
    },
    config = function() 
        local Menu = require("org-modern.menu")
        require("orgmode").setup({
            org_agenda_files = '~/Nextcloud/Org/Orgzly/**/*',
            org_default_notes_file = '~/Nextcloud/Org/Orgzly/Inbox.org',
            org_todo_keywords = {"TODO", "STARTED", "WAITING", "DELEGATED", "|", "ASSIGNED", "CANCELLED", "DONE"},
            ui = {
                menu = {
                    handler = function(data)
                        Menu:new({
                            window = {
                                margin = { 1, 0, 1, 0 },
                                padding = { 0, 1, 0, 1 },
                                title_pos = "center",
                                border = "single",
                                zindex = 1000,
                            },
                            icons = {
                                separator = "➜",
                            },
                        }):open(data)
                    end,
                },
            },
            mappings = {
                org = {
                    org_todo = "<localleader>tt",
                    org_todo_prev = "<localleader>tT",
                    org_change_date = "<localleader>td",
                    org_priority_up = "<localleader>tR",
                    org_priority_down = "<localleader>tr",
                }
            }
        })
        require('org-bullets').setup()
        require('blink.cmp').setup({
            sources = {
                per_filetype = {
                    org = {'orgmode'}
                },
                providers = {
                    orgmode = {
                        name = 'Orgmode',
                        module = 'orgmode.org.autocompletion.blink',
                        fallbacks = { 'buffer' },
                    },
                },
            },
        })

        require('telescope').setup()
        require('telescope').load_extension('orgmode')
        vim.keymap.set('n', '<leader>r', require('telescope').extensions.orgmode.refile_heading)
        vim.keymap.set('n', '<leader>fh', require('telescope').extensions.orgmode.search_headings)
        vim.keymap.set('n', '<leader>li', require('telescope').extensions.orgmode.insert_link)
    end,
}
