--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- icon picker
--  https://github.com/ziontee113/icon-picker.nvim

return {
    "ziontee113/icon-picker.nvim",
    cmd = {
        "IconPickerNormal",
        "IconPickerInsert",
        "IconPickerYank",
    },
    config = function()
        require("icon-picker").setup({ disable_legacy_commands = true })
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<Leader>si", "<cmd>IconPickerNormal<cr>", opts)
        vim.keymap.set("n", "<Leader>sy", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
    end,
}
