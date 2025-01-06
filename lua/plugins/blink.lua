--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "saghen/blink.cmp",
    dependencies = { 
        "epwalsh/obsidian.nvim",
        "saghen/blink.compat",
        "mikavilpas/blink-ripgrep.nvim",
    },
    opts = {
        sources = {
            compat = { "obsidian", "obsidian_new", "obsidian_tags" },
            default = {
                "ripgrep",
            },
            providers = {
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    ---@module "blink-ripgrep"
                    ---@type blink-ripgrep.Options
                    opts = {
                        prefix_min_len = 3,
                        context_size = 5,
                        max_filesize = "1M",
                        project_root_marker = ".git",
                        search_casing = "--ignore-case",
                        additional_rg_options = {},
                        fallback_to_regex_highlighting = true,
                        debug = false,
                    },
                    transform_items = function(_, items)
                        for _, item in ipairs(items) do
                            item.labelDetails = {
                                description = "(rg)",
                            }
                        end
                        return items
                    end,
                },
            },
        },
    },
    keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<c-g>"] = {
            function()
                -- invoke manually, requires blink >v0.8.0
                require("blink-cmp").show({ providers = { "ripgrep" } })
            end,
        },
    },
    completion = {
        list = {
            selection = "auto_insert",
        }
    },
}
