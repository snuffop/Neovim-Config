-- Options

vim.cmd([[colorscheme dracula]]) -- Set color scheme
vim.opt.termguicolors = true
vim.o.pumheight = 10 -- Max items to show in pop up menu
vim.o.cmdheight = 1 -- Max items to show in command menu
vim.o.spell = false
vim.o.spelllang = "en_us"

-- Files and Others
vim.o.fileencoding = "utf-8" -- File Encoding
vim.g.loaded_netrw = 1 -- Helps opening links in the internet (probabilly -_-)
vim.g.loaded_netrwPlugin = 1
vim.o.autochdir = true
vim.cmd("filetype plugin indent on")
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"

-- Split Windows
vim.o.splitbelow = true
vim.o.splitright = true

-- Update and backups
vim.o.conceallevel = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 50
vim.o.timeoutlen = 100
vim.o.swapfile = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- clipboard
vim.o.clipboard = "unnamedplus"

-- Backspace key
vim.o.backspace = "indent,eol,start"

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Mouse and Scrolling
vim.o.scrolloff = 10
vim.o.sidescrolloff = 5
vim.o.mouse = "a"

-- Wrapping
vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.wo.signcolumn = "yes"
vim.o.showcmd = true
vim.o.showcmdloc = "statusline"

-- Tabs and indentations
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.showtabline = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smarttab = true

-- Folding
vim.opt.foldlevel = 20

vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")
vim.opt.fillchars = { eob = " " }

vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.

-- Nvim Notify
vim.notify = require("notify")

-- Auto Formatting and LSP settings
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

--vim.o.isfname:append("@-@")
--vim.o.iskeyword:append("-") -- hyphenated words recognized by searches
-- vim.o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

-- Markdown
vim.g.markdown_recommended_style = 0
vim.g.loaded_perl_provider = 0

-- Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
