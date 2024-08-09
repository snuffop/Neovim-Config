# Marty Buchaus' Neovim Configuration

<a href="https://dotfyle.com/snuffop/nvim"><img src="https://dotfyle.com/snuffop/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/snuffop/nvim"><img src="https://dotfyle.com/snuffop/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/snuffop/nvim"><img src="https://dotfyle.com/snuffop/nvim/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:snuffop/Nvim ~/.config/snuffop/Nvim
NVIM_APPNAME=snuffop/Nvim/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=snuffop/Nvim/ nvim
```

## Plugins

### color

+ [rachartier/tiny-devicons-auto-colors.nvim](https://dotfyle.com/plugins/rachartier/tiny-devicons-auto-colors.nvim)
### colorscheme

+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
### completion

+ [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### cursorline

+ [sarrisv/readermode.nvim](https://dotfyle.com/plugins/sarrisv/readermode.nvim)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [bennypowers/nvim-regexplainer](https://dotfyle.com/plugins/bennypowers/nvim-regexplainer)
### file-explorer

+ [mikavilpas/yazi.nvim](https://dotfyle.com/plugins/mikavilpas/yazi.nvim)
+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
+ [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
### fuzzy-finder

+ [ibhagwan/fzf-lua](https://dotfyle.com/plugins/ibhagwan/fzf-lua)
+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [f-person/git-blame.nvim](https://dotfyle.com/plugins/f-person/git-blame.nvim)
+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [akinsho/git-conflict.nvim](https://dotfyle.com/plugins/akinsho/git-conflict.nvim)
### icon

+ [ziontee113/icon-picker.nvim](https://dotfyle.com/plugins/ziontee113/icon-picker.nvim)
+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### lsp

+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [jose-elias-alvarez/typescript.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/typescript.nvim)
### markdown-and-latex

+ [OXY2DEV/markview.nvim](https://dotfyle.com/plugins/OXY2DEV/markview.nvim)
+ [toppair/peek.nvim](https://dotfyle.com/plugins/toppair/peek.nvim)
### media

+ [3rd/image.nvim](https://dotfyle.com/plugins/3rd/image.nvim)
### note-taking

+ [epwalsh/obsidian.nvim](https://dotfyle.com/plugins/epwalsh/obsidian.nvim)
### nvim-dev

+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
+ [nvim-lua/popup.nvim](https://dotfyle.com/plugins/nvim-lua/popup.nvim)
+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### preconfigured

+ [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)
### quickfix

+ [kevinhwang91/nvim-bqf](https://dotfyle.com/plugins/kevinhwang91/nvim-bqf)
### startup

+ [nvimdev/dashboard-nvim](https://dotfyle.com/plugins/nvimdev/dashboard-nvim)
### statusline

+ [b0o/incline.nvim](https://dotfyle.com/plugins/b0o/incline.nvim)
+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### utility

+ [doctorfree/cheatsheet.nvim](https://dotfyle.com/plugins/doctorfree/cheatsheet.nvim)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
### version-manager

+ [fredeeb/tardis.nvim](https://dotfyle.com/plugins/fredeeb/tardis.nvim)
## Language Servers

+ html


## Details 

Using Lazyvim to start with and many tweaks along the way. My Lua-fu is weak and I am working to get
better.
No Warranty Unless you're a used car.

Funny saying I heard the other day "Your Pizza's extended warranty is fine"

## Notes

- 2024 07 31 and now back to Obsidian again.. neorg is too immature yet.. I still don't like markdown but It's growing on me.
- 2024-07-14 Now Back to Neorg. Obsidian is too Mac ish to0 much (do it our way)
- 2024-06-12 Migration to obsidian again as neorg is still too immature for my workflow.

- Using Lua Function to obfuscate passwords.
- Pushed distant into disabled
- Learn Things about LSP setup of each language server!
- Using Lazyvim for the base config and reference
- I have been using Neovim for a few days, and I am getting to like it. I used Vim for years and
  Migrated to Spacemacs then Doom about 10 years ago. Now Neovim has a ton of new development and
  community involvement. Good to see
