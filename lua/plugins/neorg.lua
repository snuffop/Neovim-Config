-- Neorg Config

require('neorg').setup {
    load = {
        ["core.concealer"] = {
            config = {
                folds = true,
            },
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
                name = "[Neorg]",
            },
        },
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/Nextcloud/Neorg",
                    joyent = "~/Nextcloud/Joyent/Neorg",
                },
                default_workspace = "notes",
                index = "index.norg",
            }
        },
        ["core.dirman.utils"] = {},
        ["core.export"] = {
            config = {
                export_dir = "~/Nextcloud/Neorg/Export/<language>-export",
            },
        },
        ["core.export.markdown"] = {},
        ["core.esupports.indent"] = {},
        ["core.esupports.metagen"] = {},
        ["core.itero"] = {},
        ["core.journal"] = {
            config = {
                workspace = "notes",
            }
        },
        ["core.keybinds"] = {},
        ["core.looking-glass"] = {},
        ["core.summary"] = {},
        ["core.syntax"] = {},
        ["core.ui.calendar"] = {},
        ["core.integrations.telescope"] = {},
        ["core.integrations.treesitter"] = {},
        ["external.templates"] = {
            config = {
                templates_dir = vim.fn.stdpath("config") .. "/templates/neorg",
                default_subcommand = "add", -- or "fload", "load"
                snippets_overwrite = {},
            },
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

