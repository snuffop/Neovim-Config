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
    { "LudoPinelli/comment-box.nvim" },
    { "ThePrimeagen/git-worktree.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "adrianvalenz/chronos.nvim" },
    { "ahmedkhalf/project.nvim" },
    { "akinsho/toggleterm.nvim" },
    { "alker0/chezmoi.vim" },
    { "christoomey/vim-tmux-navigator" },
    { "folke/trouble.nvim" },
    { "folke/which-key.nvim" },
    { "glepnir/lspsaga.nvim" },
    { "hiphish/rainbow-delimiters.nvim" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/nvim-cmp" },
    { "jay-babu/mason-null-ls.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "lewis6991/gitsigns.nvim" },
    { "mattn/calendar-vim" },
    { "mattn/emmet-vim" },
    { "max397574/better-escape.nvim" },
    { "mechatroner/rainbow_csv" },
    { "moll/vim-bbye" },
    { "neovim/nvim-lspconfig", },
    { "norcalli/nvim-colorizer.lua" },
    { "nvim-lualine/lualine.nvim" },
    { "onsails/lspkind.nvim" },
    { "pearofducks/ansible-vim" },
    { "preservim/tagbar" },
    { "saadparwaiz1/cmp_luasnip", },
    { "theprimeagen/harpoon" },
    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/mason.nvim" },
    { "windwp/nvim-ts-autotag" },
    { "xiyaowong/transparent.nvim" },
    { "yamatsum/nvim-cursorline" },
    { 'samoshkin/vim-mergetool' },

    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- Buffer Line
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    },

    -- Distant
    {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.3',
        config = function()
            require('distant'):setup()
        end
    },

    -- Dash Board
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    },

    -- HOP
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {},
    },

    -- Indent Line
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- Hard Time
    {
        "m4xshen/hardtime.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim"
        },
    },

    --- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        build = function() 
            vim.fn["mkdp#util#install"]() 
        end,
    },

    -- Neorg 
    {
        "nvim-neorg/neorg",
        build = ":Neorg wync-parsers",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neorg/neorg-telescope",
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
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        cmd = {
            "NvimTreeOpen",
            "NvimTreeToggle",
            "NvimTreeFocus",
            "NvimTreeFileFile",
            "NvimTreeCollapse",
        },
    },

    -- Org mode
    {
        "nvim-orgmode/orgmode",
        ft = "org",
    },

    -- OIL
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Taskwiki
    {
        "tools-life/taskwiki",
        init = function()
            vim.g.taskwiki_markup_syntax = "markdown"
        end,
    },

    -- Telescope
    { "nvim-telescope/telescope.nvim",
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

    -- treesj
    {
        "Wansmer/treesj",
        cmd = {
            "TSJToggle",
            "TSJSplit",
            "TSJJoin"
        },
        opts = {
            use_default_keymaps = false
        },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "bufWinEnter",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    -- Treesitter Text objects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
    },

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

    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mfussenegger/nvim-dap" },
    },

    -- Mini 
    {
        'echasnovski/mini.nvim',
        version = '*',
    },

    { 'echasnovski/mini.surround',
        version = '*',
    },

    { 'echasnovski/mini.comment',
        version = '*',
    },

    {
        'echasnovski/mini.pairs',
        version = '*',
    },
    -- END MINI

    -- Staruptime
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        init = function() 
            vim.g.startuptime_tries = 10 
        end,
    },

    -- SUDA
    {
        "lambdalisue/suda.vim",
        cmd = {
            "SudaRead",
            "SudaWrite",
        },
    },

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
            vim.g.vimwiki_markdown_link_ext = 1 end,
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

    -- ==============================================================
} -- end of plugin line

local opts = {
    checker = {
        enabled = true,
    },
}

require("lazy").setup(plugins, opts)
