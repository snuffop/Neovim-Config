-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.maplocalleader = ","

vim.o.showcmdloc = "statusline"

vim.o.termguicolors = true

-- Tabs and indentations
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.showtabline = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.textwidth = 80
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smarttab = true

-- Folding
vim.o.foldlevel = 99
vim.o.conceallevel = 2
vim.o.concealcursor = "nc"

-- Update and backups
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 50
vim.o.timeoutlen = 100
vim.o.swapfile = false
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.o.undofile = true

vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.opt.conceallevel = 1

vim.o.guifont = "DejaVu Sans Mono:h9"
