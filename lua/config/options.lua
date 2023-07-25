-- Options

vim.opt.backup = false
vim.opt.conceallevel = 3
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldlevel = 20
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10                                 -- Lines from the top or bottom (buffing)
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shiftwidth = 4
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.spell = false                                  -- use F3 to toggle
vim.opt.spelllang = 'en_us'
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false

vim.g.markdown_recommended_style = 0
