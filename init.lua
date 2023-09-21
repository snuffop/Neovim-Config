--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Config                              │
--  ╰──────────────────────────────────────────────────────────╯
-- Set Leaders

vim.keymap.set("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("core")
require("plugins")
