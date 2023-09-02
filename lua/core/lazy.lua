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

local plugins = {
	-- ANSIBLE
	{ "pearofducks/ansible-vim" },
	--Dash Board
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Vim Notification Popup
	{ "rcarriga/nvim-notify" },

	-- Auto Formatting
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- Better Escape
	{ "max397574/better-escape.nvim" },

	-- Calendar
	{ "mattn/calendar-vim" },

	-- Commnets Plugins
	{ "numToStr/Comment.nvim" },

	-- Colorscheme
	{ "mofiqul/dracula.nvim" },

	-- Chezmoi
	{ "alker0/chezmoi.vim" },

	-- Cursor Line
	{ "yamatsum/nvim-cursorline" },

	-- For Transparency
	{ "xiyaowong/transparent.nvim" },

	-- Rainbos CSV
	{ "mechatroner/rainbow_csv" },

	-- Colorizer.lua
	{ "norcalli/nvim-colorizer.lua" },

	{
		"tools-life/taskwiki",
		init = function()
			vim.g.taskwiki_markup_syntax = "markdown"
		end,
	},

	-- Terminal
	{ "akinsho/toggleterm.nvim" },

	-- Indent Line
	{ "lukas-reineke/indent-blankline.nvim" },

	-- GitSign Plugins
	{ "lewis6991/gitsigns.nvim" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "bufWinEnter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- Tmux Navigation
	{ "christoomey/vim-tmux-navigator" },

	-- nvim-ts-autotag
	{ "windwp/nvim-ts-autotag" },

	-- Nvim treesitter rainbow brackets
	{ "hiphish/rainbow-delimiters.nvim" },

	-- nvim autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},

	-- nvim surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
	},

	-- OIL
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.1",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				{
					"LinArcX/telescope-env.nvim",
					config = function()
						require("telescope").load_extension("env")
					end,
				},
				{
					"ghassan0/telescope-glyph.nvim",
					config = function()
						require("telescope").load_extension("glyph")
					end,
				},
				{
					"keyvchan/telescope-find-pickers.nvim",
					config = function()
						require("telescope").load_extension("find_pickers")
					end,
				},
				{
					"nvim-telescope/telescope-file-browser.nvim",
					config = function()
						require("telescope").load_extension("file_browser")
					end,
				},
				{
					"nvim-telescope/telescope-media-files.nvim",
				},
				config = function()
					require("telescope").load_extension("media_files")
				end,
			},
			{
				"benfowler/telescope-luasnip.nvim",
				config = function()
					require("telescope").load_extension("luasnip")
				end,
			},
			{
				"jvgrootveld/telescope-zoxide",
				config = function()
					require("telescope").load_extension("zoxide")
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"tsakirist/telescope-lazy.nvim",
				config = function()
					require("telescope").load_extension("lazy")
				end,
			},
			{
				"nvim-telescope/telescope-project.nvim",
				config = function()
					require("telescope").load_extension("project")
				end,
			},
			{
				"elpiloto/telescope-vimwiki.nvim",
				config = function()
					require("telescope").load_extension("vimwiki")
				end,
			},
			{
				"olacin/telescope-cc.nvim",
				config = function()
					require("telescope").load_extension("conventional_commits")
				end,
			},
		},
	},
	-- NeoGit
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
		},
	},

	-- NeoVIMTree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = {

			"NvimTreeOpen",
			"NvimTreeToggle",
			"NvimTreeFocus",
			"NvimTreeFileFile",
			"NvimTreeCollapse",
		},
	},

	-- Buffer Line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Lua Line
	{ "nvim-lualine/lualine.nvim" },

	-- WhichKey
	{ "folke/which-key.nvim" },

	-- Auto Completion
	{ "hrsh7th/nvim-cmp" }, -- cmp Completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completion
	{ "hrsh7th/cmp-path" }, -- path completion
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-cmdline" }, -- command line Completion

	{ "saadparwaiz1/cmp_luasnip" },
	-- Snipit Engine
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		version = "2.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"molleweide/LuaSnip-snippets.nvim",
			"gisphm/vim-gitignore",
			"numToStr/Comment.nvim",
		},
	},

	-- Lsp Saga
	{ "glepnir/lspsaga.nvim" },

	-- lspkind for icons with snipits
	{ "onsails/lspkind.nvim" },

	-- Managing Mason
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
	},

	-- emmet
	{ "mattn/emmet-vim" },

	-- lorem ipsum
	{ "derektata/lorem.nvim" },

	-- Neovim Tagbar
	{ "preservim/tagbar" },

	-- Project
	{ "ahmedkhalf/project.nvim" },

	-- Staruptime
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- VIM bbye
	{ "moll/vim-bbye" },
	--
	-- vimwiki
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{
					path = "~/Nextcloud/Vimwiki",
					syntax = "markdown",
					ext = ".md",
					ignoreFolders = { "node_modules", ".git" },
				},
			}
			vim.g.vimwiki_markdown_link_ext = 1
		end,
	},
	{
		"michal-h21/vimwiki-sync",
		init = function()
			vim.g.vimwiki_sync_branch = "main"
			vim.g.vimwiki_sync_commit_message = "Auto commit + push. %c"
		end,
	},

	-- Wakatime
	{
		"wakatime/vim-wakatime",
		lazy = false,
	},

	{
		"Wansmer/treesj",
		keys = { "<space>m", "<space>j", "<space>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	-- ==============================================================
} -- end of plugin line

local opts = {
	checker = {
		enabled = true,
	},
}

require("lazy").setup(plugins, opts)
