return {
    'nvim-telescope/telescope.nvim',
    -- build = function()
    --     local ts_update = require('nvim-treesitter.install').up20230704({ with_sync = true })
    --     ts_update()
    -- end,
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
            {
                'LinArcX/telescope-env.nvim',
                config = function()
                    require('telescope').load_extension("env")
                end,
            },
            {
                'ghassan0/telescope-glyph.nvim',
                config = function()
                    require('telescope').load_extension("glyph")
                end
            },
            {
                'keyvchan/telescope-find-pickers.nvim',
                config = function()
                    require('telescope').load_extension("find_pickers")
                end,
            },
            {
                'nvim-telescope/telescope-file-browser.nvim',
                config = function()
                    require('telescope').load_extension("file_browser")
                end
            },
            {
                'nvim-telescope/telescope-media-files.nvim'},
                config = function()
                    require('telescope').load_extension("media_files")
                end
            },
            {
                'benfowler/telescope-luasnip.nvim',
                config = function()
                    require('telescope').load_extension("luasnip")
                end,
            },
            {
                'jvgrootveld/telescope-zoxide',
                config = function()
                    require('telescope').load_extension("zoxide")
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end,
            },
            {
                'tsakirist/telescope-lazy.nvim',
                config = function()
                    require('telescope').load_extension("lazy")
                end,
            },
            {
                'nvim-telescope/telescope-project.nvim',
                config = function()
                    require('telescope').load_extension("project")
                end,
            },
            {
                'elpiloto/telescope-vimwiki.nvim',
                config = function()
                    require('telescope').load_extension("vimwiki")
                end,
            },
            {
                'olacin/telescope-cc.nvim',
                config = function()
                    require('telescope').load_extension("conventional_commits")
                end,
            },
            config = function()
                local project_actions = require("telescope._extensions.project.actions")
                require('telescope').setup {
                    defaults = {
                        prompt_prefix = " ",
                        selection_caret = " ",
                        path_display = {
                            shorten = { len = 12 },
                        },
                    },
                    extensions = {
                        project = {
                            base_dirs = {
                                {'~/Source/'},
                                {'~/.local/share'},
                            },
                            hidden_files = true, -- default: false
                            theme = "dropdown",
                            order_by = "asc",
                            search_by = "title",
                            sync_with_nvim_tree = true, -- default false
                            -- default for on_project_selected = find project files
                            on_project_selected = function(prompt_bufnr)
                                -- Do anything you want in here. For example:
                                project_actions.change_working_directory(prompt_bufnr, false)
                                require("harpoon.ui").nav_file(1)
                            end
                        },
                        file_browser = {
                            theme = "ivy",
                            hijack_netrw = true,
                            grouped = true,
                            sorting_strategy = 'ascending',
                            default_selection_index = 2,
                            mappings = { },
                        },
                        zoxide = {
                            prompt_title = "zoxide: ",
                        }
                    }
                }
            end
        }
    }

