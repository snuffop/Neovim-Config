return {
    {
        'saadparwaiz1/cmp_luasnip', -- snippet completions
        lasy = false,
        config = function ()
            -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } }) 
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
    },

}

