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
    { "RRethy/vim-illuminate"},
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
    { "lewis6991/gitsigns.nvim" },
    { "mattn/emmet-vim" },
    { "max397574/better-escape.nvim" },
    { "mechatroner/rainbow_csv" },
    { "moll/vim-bbye" },
    { "neovim/nvim-lspconfig", },
    { "norcalli/nvim-colorizer.lua" },
    { "nvim-lualine/lualine.nvim" },
    { "nvimtools/none-ls.nvim" },
    { "onsails/lspkind.nvim" },
    { "pearofducks/ansible-vim" },
    { "preservim/tagbar" },
    { "renerocksai/calendar-vim" },
    { "saadparwaiz1/cmp_luasnip", },
    { "theprimeagen/harpoon" },
    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/mason.nvim" },
    { "windwp/nvim-ts-autotag" },
    { "xiyaowong/transparent.nvim" },
    { "yamatsum/nvim-cursorline" },
    { 'is0n/fm-nvim' },
    { 'samoshkin/vim-mergetool' },


    -- Buffer Line
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    },

    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
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

    -- Hard Time
    {
        "m4xshen/hardtime.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim"
        },
    },

    -- Indent Line
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- MarkdownTable

    {
        "tyrossel/MarkdownTable.nvim",
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
            {"nvim-lua/plenary.nvim"},
            {"nvim-neorg/neorg-telescope"},
        },
    },

    -- Nerdy (Nerd font glyph selector)
    {
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim',
        },
        cmd = 'Nerdy',
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

    -- Obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
    },

    -- obsidian Bridge
    {
        "oflisback/obsidian-bridge.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function() require("obsidian-bridge").setup({
            obsidian_server_address = "http://localhost:27123"
        }) end,
        event = {
            "BufReadPre *.md",
            "BufNewFile *.md",
        },
        lazy = true,
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

    -- pomo nvim
    {
        "epwalsh/pomo.nvim",
        version = "*",  -- Recommended, use latest release instead of latest commit
        lazy = true,
        cmd = { "TimerStart", "TimerRepeat" },
        dependencies = {
            -- Optional, but highly recommended if you want to use the "Default" timer
            "rcarriga/nvim-notify",
        },
    },

    -- Peek markdown Previewer
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup()
            -- refer to `configuration to change defaults`
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
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
            "nvim-telescope/telescope-symbols.nvim",
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
