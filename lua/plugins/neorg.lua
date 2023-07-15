-- neorg 
return {
    'nvim-neorg/neorg',
    cmd = "Neorg",
    ft = "neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-neorg/neorg-telescope',
    },
    opts = {
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.manoeuvre"] = {},
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
                    engine = "nvim-cmp"
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
                        joyent = "~/Nextcloud/Neorg/joyent"
                    },
                    default_workspace = "notes",
                },
            },
            ["core.integrations.telescope"] = {},
        },
    }
}
