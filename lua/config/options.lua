-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mail = "marty@dabuke.com"
vim.g.user = "Mbuchaus (Snuffop)"

-- vim.cmd("language en_US.utf8")

vim.g.maplocalleader = ","

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
vim.o.termguicolors = true
vim.o.textwidth = 100

-- Folding
vim.o.concealcursor = "nc"
vim.o.conceallevel = 2
vim.o.foldlevel = 99

-- Update and backups
vim.o.backup = true
vim.o.backupdir = os.getenv("HOME") .. "/.config/nvim/etc/backup"
vim.o.directory = os.getenv("HOME") .. "/.config/nvim/etc/swp"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.showcmdloc = "statusline"
vim.o.showmode = false
vim.o.swapfile = true
vim.o.timeoutlen = 100
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/etc/undodir"
vim.o.undofile = true
vim.o.updatetime = 50
vim.o.writebackup = false

-- Lang Specific
vim.cmd([[
 let g:loaded_ruby_provider = 0
 let g:python3_host_prog = "/usr/bin/python3"
]])

-- GUI Settings
vim.o.guifont = "DejaVu Sans Mono:h9"
