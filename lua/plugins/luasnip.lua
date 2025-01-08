--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

----------------------------------------------------------------------
--                             LuaSnip                              --
--        Add Options to allow for neotab usage if detected         --
--                  or luasnip if inside a snippet                  --
----------------------------------------------------------------------

return {
    "L3MON4D3/LuaSnip",
    dependencies = { "neotab.nvim", },
    keys = {
        {
            "<Tab>",
            function()
                return require("luasnip").jumpable(1) --
                        and "<Plug>luasnip-jump-next"
                    or "<Plug>(neotab-out)"
            end,
            expr = true,
            silent = true,
            mode = "i",
        },
    },
}
