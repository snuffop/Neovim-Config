-- Marty Buchaus Neovim Config

-- Set Leaders

vim.keymap.set("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocaleader = ","

-- include/reuqire
require 'config.options'

-- Bootstrap Lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
  },
  dev = {
    path = "~/Source",
  },
  checker = {
    enabled = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
})
-- pull in keymaps and which-key config
require 'config.keymaps'

-- Set colorscheme
vim.cmd([[colorscheme dracula]])

--
