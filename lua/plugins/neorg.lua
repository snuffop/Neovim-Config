-- neorg 
return {
    'nvim-neorg/neorg',
--    commit = "e76f0cb",  -- Breaking changes on vhyrro's commit
    cmd = "Neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-lua/plenary.nvim',
        'nvim-neorg/neorg-telescope',
        {
            'pysan3/neorg-templates',
            dependencies = {
                "L3MON4D3/LuaSnip",
            },
        },
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "norg" },
            highlight = {
                enable = true,
            },
        }

        require("neorg").setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.summary"] = {},
                ["core.export"] = {
                    config = {
                        export_dir = { "~/Nextcloud/Neorg/export" },
                    }
                },
                ["core.export.markdown"] = {
                    config = {
                        extension = "md"
                    }
                },
                ["core.keybinds"] = {
                    config = {
                        default_keybinds = true,
                    }
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                        name = "[Neorg]",
                    }
                },
                ["core.journal"] = {
                    config = {
                        journal_folder = "journals",
                        workspace = 'notes',
                    }
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/Nextcloud/Neorg/notes",
                        },
                        default_workspace = "notes",
                    },
                },
                ["core.integrations.telescope"] = {},
                ["external.templates"] = {
                    config = {
                        templates_dir =  "~/Nextcloud/Neorg/templates/",
                    },
                },
            }
        }
    end,
}
