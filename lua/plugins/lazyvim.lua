--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {

    {
        "folke/tokyonight.nvim",
        enable = true,
        opts = { 
            style = "night",
        },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },

    {
        'snacks.nvim',
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
        },
    },

    {
        "akinsho/bufferline.nvim",
        enabled = false,
    },

    {
        "saghen/blink.cmp",
        opts = {
            sources = {
                completion = {
                    enabled_providers = {
                        "lsp",
                        "path",
                        "snippets",
                        "buffer",
                        "obsidian",
                        "obsidian_new",
                        "obsidian_tags",
                    },
                },
            },
            providers = {
                obsidian = {
                    name = "obsidian",
                    module = "blink.compat.source",
                },
                obsidian_new = {
                    name = "obsidian_new",
                    module = "blink.compat.source",
                },
                obsidian_tags = {
                    name = "obsidian_tags",
                    module = "blink.compat.source",
                },
            },
        },

    }
}


