--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯
--
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
  augroup _general_settings
  autocmd!
  autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
  autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
  autocmd BufWinEnter * :set formatoptions-=cro
  autocmd FileType qf set nobuflisted
  augroup end

]])

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "**nagios*/*/*.cfg",
    "/*etc/nagios/*.cfg",
    "*groundwork/nagios/etc/*.cfg",
    "/var/lib/nagios/objects.cache",
  },
  callback = function()
    vim.bo.filetype = "nagios"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "**nagios*/*/*.cfg.j2",
  },
  callback = function()
    vim.bo.filetype = "nagios.jinja"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "**/playbooks/*.yml",
    "**/playbooks/*.yaml",
    "**/roles/*/tasks/*.yml",
    "**/roles/*/tasks/*.yaml",
    "**/roles/*/handlers/*.yml",
    "**/roles/*/handlers/*.yaml",
  },
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "**/inventory/**hosts",
  },
  callback = function()
    vim.bo.filetype = "conf"
  end,
})

-- Set type for systemd files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*.service*",
    "*.timer*",
  },
  callback = function()
    vim.bo.filetype = "systemd"
  end,
})

vim.api.nvim_create_autocmd({ "UIEnter" }, {
  callback = function(event)
    local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
    if client ~= nil and client.name == "Firenvim" then
      vim.o.laststatus = 0
    end
  end,
})

-- Disable autoformat for some files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { 
        "lua",
        "markdown",
    },
  callback = function()
    vim.b.autoformat = false
  end,
})


