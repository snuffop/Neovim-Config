return {
    {
        'saadparwaiz1/cmp_luasnip', -- snippet completions
        lazy = false,
    },

    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        version = "2.*",
        dependencies = {
            { "rafamadriz/friendly-snippets" },
            { "molleweide/LuaSnip-snippets.nvim" },
            { "gisphm/vim-gitignore" },
            { "numToStr/Comment.nvim" },
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
            require("luasnip.loaders.from_lua").lazy_load({
                paths = vim.fn.stdpath("config") .. "/lua/snippets",
            })

            require('luasnip').setup{
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true,
            }
        end,
    },
}

