-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.user = "Mbuchaus (Snuffop)"
vim.g.mail = "marty@dabuke.com"

vim.cmd("language en_US.utf8")

vim.g.maplocalleader = ","

vim.o.showcmdloc = "statusline"

vim.o.termguicolors = true

-- Tabs and indentations
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.smartindent = true
vim.bo.tabstop = 4
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.showtabline = 4
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.textwidth = 100

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
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/etc/undodir"
vim.o.backupdir = os.getenv("HOME") .. "/.config/nvim/etc/backup"
vim.o.directory = os.getenv("HOME") .. "/.config/nvim/etc/swp"
vim.o.undofile = true

vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.opt.conceallevel = 2

vim.o.guifont = "DejaVu Sans Mono:h9"

vim.cmd([[
 let g:loaded_ruby_provider = 0
 let g:python3_host_prog = "/usr/bin/python3"
]])

-- disable autoformat by default ( toggle on if needed )
vim.g.autoformat = false
