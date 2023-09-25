require('neorg').setup {
    load = {
        ["core.concealer"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/Nextcloud/Neorg",
                },
                default_workspace = "notes",
                index = "index.norg",
            }
        },
        ["core.journal"] = {
            config = {
                workspace = "notes",
                use_template = false,
            }
        },
        ["core.summary"] = {},
        ["core.ui.calendar"] = {},
        ["core.integrations.telescope"] = {},
        ["external.templates"] = {
            config = {
                templates_dir = {
                    "~/Nextcloud/Neorg/templates/"
                }
            }
        },
    },
}

local neorg_callbacks = require("neorg.core.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)
