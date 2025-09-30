--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

-- https://github.com/s1n7ax/nvim-comment-frame

return {
    "s1n7ax/nvim-comment-frame",
    dependencies = { 
        "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,

    config = function()
        require('nvim-comment-frame').setup({
            disable_default_keymap = true,
        })
    end,
}
