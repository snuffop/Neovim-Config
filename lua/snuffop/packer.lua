local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
    use { "wbthomason/packer.nvim" } -- Have packer manage itself
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "ahmedkhalf/project.nvim" }
    use { "akinsho/bufferline.nvim" }
    use { "akinsho/toggleterm.nvim" }
    use { "alker0/chezmoi.vim" } -- chezmoi syntax
    use { "arnarg/todotxt.nvim" }
    use { "christoomey/vim-tmux-navigator" }
    use { "dhruvasagar/vim-table-mode" }
    use { "fladson/vim-kitty" } -- Kitty Syntax
    use { "folke/trouble.nvim" }
    use { "folke/which-key.nvim"}
    use { "goolord/alpha-nvim" }
    use { "kevinhwang91/rnvimr" }  -- Ranger
    use { "kyazdani42/nvim-tree.lua" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "kylechui/nvim-surround" }
    use { "lewis6991/impatient.nvim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "mbbill/undotree" } -- undo tree
    use { "moll/vim-bbye" }
    use { "numToStr/Comment.nvim" }
    use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
    use { "nvim-lualine/lualine.nvim" }
    use { "nvim-treesitter/nvim-treesitter" }
    use { "theprimeagen/harpoon"}
    use { "wakatime/vim-wakatime" }
    use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
    use { "tomiis4/Hypersonic.nvim" } -- REGEX Build and test

    -- neorg 
    use {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
        after = {
            'nvim-treesitter',
        },
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-neorg/neorg-telescope" },
        },
    }

    -- Ansible 
    use { 'pearofducks/ansible-vim' }

    --Noice
    use { "folke/noice.nvim" }
    use { "MunifTanjim/nui.nvim" }
    use { "rcarriga/nvim-notify" }

    -- Colorschemes
    use { "Mofiqul/dracula.nvim" }
    use { "marko-cerovac/material.nvim" }

    -- Cmp 
    use { "hrsh7th/nvim-cmp" } -- The completion plugin
    use { "hrsh7th/cmp-buffer" } -- buffer completions
    use { "hrsh7th/cmp-path" } -- path completions
    use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }

    -- Snippets
    use { "L3MON4D3/LuaSnip" } --snippet engine
    use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Obsidian
    use { 
        "epwalsh/obsidian.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"hrsh7th/nvim-cmp"},
            {"nvim-telescope/telescope.nvim"},
            {"godlygeek/tabular"},
            {"preservim/vim-markdown"},
        }
    }

    -- Telescope
    use { "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim"},
            { "LinArcX/telescope-env.nvim"},
            { "ghassan0/telescope-glyph.nvim"},
            { "keyvchan/telescope-find-pickers.nvim"},
            { "nvim-telescope/telescope-file-browser.nvim"},
            { "nvim-telescope/telescope-fzf-native.nvim"},
            { "nvim-telescope/telescope-packer.nvim"},
            { "nvim-telescope/telescope-media-files.nvim"},
            { "benfowler/telescope-luasnip.nvim"},
            { "jvgrootveld/telescope-zoxide"},
        },
        run = function()
            local ts_update = require('nvim-treesitter.install').up20230704({ with_sync = true })
            ts_update()
        end,
    }

    -- Git
    use { "lewis6991/gitsigns.nvim" }
    use { "tpope/vim-fugitive" }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
