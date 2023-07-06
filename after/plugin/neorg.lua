local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
    return
end

neorg.setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.manoeuvre"] = {},
        ["core.export"] = {},
        ["core.export.markdown"] = {},
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
            }
        },
        ["core.integrations.telescope"] = {},

        ["core.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.journal"] = {
            config = {
                workspace = 'default',
            }
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    default = "~/Nextcloud/Neorg/notes",
                    joyent = "~/Nextcloud/Neorg/joyent"
                },
                default_workspace = "default",
            },
        },
    },
}

