--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {
    "andrewferrier/wrapping.nvim",
    lazy = false,
    config = function()
        require("wrapping").setup()
    end,
}
