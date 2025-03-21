--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

vim.g.mail = "marty@dabuke.com"
vim.g.user = "Mbuchaus (Snuffop)"

vim.g.mapleader = " "
vim.g.maplocalleader = ","

----------------------------------------------------------------------
--                           Auto Format                            --
----------------------------------------------------------------------

vim.g.autoformat = true

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
vim.o.conceallevel = 2

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
--                             LazyVim                              --
----------------------------------------------------------------------

--vim.g.lazyvim_picker = "fzf-lua"

----------------------------------------------------------------------
--                           GUI Settings                           --
----------------------------------------------------------------------

vim.o.guifont = "DejaVu Sans Mono:h14"

----------------------------------------------------------------------
--         disable diagnostics by default (allowing toggle)         --
----------------------------------------------------------------------

vim.diagnostic.enable(false)

----------------------------------------------------------------------
--                         LazyVim Options                          --
----------------------------------------------------------------------

vim.g.lazyvim_prettier_needs_config = true


----------------------------------------------------------------------
--           Require the colors.lua module and access the           --
--                     colors directly without                      --
----------------------------------------------------------------------

vim.cmd(string.format([[highlight WinBar1 guifg=%s]], "#b4f9f8"))
vim.cmd(string.format([[highlight WinBar2 guifg=%s]], "#c3e88d"))
-- Function to get the full path and replace the home directory with ~
local function get_winbar_path()
  local full_path = vim.fn.expand("%:p")
  return full_path:gsub(vim.fn.expand("$HOME"), "~")
end
-- Function to get the number of open buffers using the :ls command
local function get_buffer_count()
  local buffers = vim.fn.execute("ls")
  local count = 0
  -- Match only lines that represent buffers, typically starting with a number followed by a space
  for line in string.gmatch(buffers, "[^\r\n]+") do
    if string.match(line, "^%s*%d+") then
      count = count + 1
    end
  end
  return count
end

----------------------------------------------------------------------
--                  Function to update the winbar                   --
----------------------------------------------------------------------

local function update_winbar()
  local home_replaced = get_winbar_path()
  local buffer_count = get_buffer_count()
  vim.opt.winbar = "%#WinBar1#%m "
    .. "%#WinBar2#("
    .. buffer_count
    .. ") "
    .. "%#WinBar1#"
    .. home_replaced
    .. "%*%=%#WinBar2#"
  -- I don't need the hostname as I have it in lualine
    .. vim.fn.systemlist("hostname")[1]
end
-- Autocmd to update the winbar on BufEnter and WinEnter events
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = update_winbar,
})
