--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

vim.g.mail = "marty@dabuke.com"
vim.g.user = "Mbuchaus (Snuffop)"
vim.g.maplocalleader = ","
vim.g.mapleader = " "

----------------------------------------------------------------------
--                           Snacks
----------------------------------------------------------------------

vim.g.snacks_animate = true
vim.g.lazyvim_picker = "snacks"

----------------------------------------------------------------------
--                           Auto Format                            --
----------------------------------------------------------------------

vim.g.autoformat = false

----------------------------------------------------------------------
--                      Tabs and indentations                       --
----------------------------------------------------------------------

vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.smartindent = true
vim.bo.tabstop = 4
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.showtabline = 0
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.textwidth = 100

----------------------------------------------------------------------
--                             Conceal                              --
----------------------------------------------------------------------

vim.o.concealcursor = "nc"
vim.o.conceallevel = 1

----------------------------------------------------------------------
--                             Wrap                                --
----------------------------------------------------------------------

vim.o.linebreak = false
vim.o.wrap = false

----------------------------------------------------------------------
--                             Folding                              --
----------------------------------------------------------------------

vim.o.foldlevel = 99

-- Update and backups
vim.o.backup = true
vim.o.backupdir = os.getenv("HOME") .. "/.config/nvim/etc/backup"
vim.o.directory = os.getenv("HOME") .. "/.config/nvim/etc/swp"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.showcmdloc = "statusline"
vim.o.showmode = false
vim.o.swapfile = false
vim.o.timeoutlen = 100
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/etc/undodir"
vim.o.undofile = true
vim.o.updatetime = 50
vim.o.writebackup = false

----------------------------------------------------------------------
--                          Lang Specific                           --
----------------------------------------------------------------------

vim.cmd([[
" let g:ruby_host_prog = "/home/marty/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host"
let g:python3_host_prog = "/usr/bin/python3"
let g:loaded_perl_provider = 0
]])

----------------------------------------------------------------------
--                           GUI Settings                           --
----------------------------------------------------------------------

vim.o.guifont = "DejaVu Sans Mono:h14"

----------------------------------------------------------------------
--         Disable diagnostics by default (allowing toggle)         --
----------------------------------------------------------------------

vim.diagnostic.enable(false)

----------------------------------------------------------------------
--                         Markdown Options                         --
----------------------------------------------------------------------

vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  underline = true,
  severity_sort = true,
  update_in_insert = false,
})

vim.g.markdown_fenced_languages = {
  "bash=sh", "sh", "zsh",
  "lua", "vim", "python", "javascript", "typescript", "tsx",
  "json", "yaml", "toml", "mermaid=mermaid",
}

----------------------------------------------------------------------
--                         LazyVim Options                          --
----------------------------------------------------------------------

vim.g.lazyvim_prettier_needs_config = true

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldnestmax = 1

vim.opt.exrc = true
vim.opt.secure = true
vim.opt.shadafile = ".vim/project.shada"

--EOF
