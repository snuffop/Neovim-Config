--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- https://github.com/rachartier/tiny-devicons-auto-colors.nvim

return {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
        require("tiny-devicons-auto-colors").setup()
    end,
}
