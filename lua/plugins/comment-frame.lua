--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {
    "s1n7ax/nvim-comment-frame",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    config = function()
        require('nvim-comment-frame').setup({
            disable_default_keymap = true,
        })
    end,
}
