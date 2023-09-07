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

    -- Formatting,
    { "jose-elias-alvarez/null-ls.nvim" },

    -- Better Escapej
    { "max397574/better-escape.nvim" },

    -- Calendar
    { "mattn/calendar-vim" },

    -- Commnets Plugins
    { "numToStr/Comment.nvim" },

    -- Colorscheme
    { "mofiqul/dracula.nvim" },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- Chezmoi
    { "alker0/chezmoi.vim" },

    -- Leap AVY
    {
        "ggandor/leap.nvim",
    },

    -- Cursor Line
    { "yamatsum/nvim-cursorline" },

    -- emmet
    { "mattn/emmet-vim" },

    -- For Transparency
    { "xiyaowong/transparent.nvim" },


    -- Colorizer.lua
    { "norcalli/nvim-colorizer.lua" },

    -- GitSign Plugins
    { "lewis6991/gitsigns.nvim" },

    {
        "m4xshen/hardtime.nvim",
        dependencies = { 
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim"
        },
    },
    -- Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },

    -- Indent Line
    { "lukas-reineke/indent-blankline.nvim" },

    -- Rainbos CSV
    { "mechatroner/rainbow_csv" },

    -- nvim-ts-autotag
    { "windwp/nvim-ts-autotag" },

    -- Nvim treesitter rainbow brackets
    { "hiphish/rainbow-delimiters.nvim" },

    -- nvim autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
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

    -- nvim surround
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
    },

    -- Org mode
    {
        "nvim-orgmode/orgmode",
        ft = "org",
    },

    -- OIL
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- taskwiki
    {
        "tools-life/taskwiki",
        init = function()
            vim.g.taskwiki_markup_syntax = "markdown"
        end,
    },

    -- Terminal
    { "akinsho/toggleterm.nvim" },

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

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        -- tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "LinArcX/telescope-env.nvim",
            "ghassan0/telescope-glyph.nvim",
            "keyvchan/telescope-find-pickers.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-media-files.nvim",
            "benfowler/telescope-luasnip.nvim",
            "jvgrootveld/telescope-zoxide",
            "tsakirist/telescope-lazy.nvim",
            "nvim-telescope/telescope-project.nvim",
            "elpiloto/telescope-vimwiki.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
    },

    -- Buffer Line
    {
        "akinsho/bufferline.nvim",
        after = "catppuccin",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Lua Line
    { "nvim-lualine/lualine.nvim" },

    -- WhichKey
    { "folke/which-key.nvim" },

    -- Auto Completion
    { "hrsh7th/nvim-cmp" },   -- cmp Completion plugin
    { "hrsh7th/cmp-buffer" }, -- buffer completion
    { "hrsh7th/cmp-path" },   -- path completion
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

    -- Trouble
    { "folke/trouble.nvim" },

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
