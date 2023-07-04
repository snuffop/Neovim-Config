
vim.opt.autochdir = true
vim.opt.backup = false                                  -- creates a backup file
vim.opt.cmdheight = 1
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldenable = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.linebreak = true
vim.opt.scrolloff = 15
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.winbar = "%=%m %f"
vim.opt.wrap = false
