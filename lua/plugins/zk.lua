--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- ZK config

return {
    {
        "zk-org/zk-nvim",
        lazy = false,
        config = function ()
            require("zk").setup({
                picker = "snacks_picker",
                picker_options = {
                    snacks_picker = {
                        layout = {
                            preset = "ivy",
                        },
                    },
                },
                lsp = {
                    config = {
                        name = "zk",
                        cmd = {"zk", "lsp"},
                        filetypes = { "markdown" },
                    }
                },
                auto_attach = {
                    enable = true,
                }
            })

            local zk = require("zk")
            local commands = require("zk.commands")
            local function make_edit_fn(defaults, picker_options)
                return function(options)
                    options = vim.tbl_extend("force", defaults, options or {})
                    zk.edit(options, picker_options)
                end
            end

            commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
            commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

        end
    },
}

