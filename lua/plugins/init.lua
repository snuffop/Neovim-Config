--- Core plugins to split out

return {

    'JoosepAlviste/nvim-ts-context-commentstring',
    'ahmedkhalf/project.nvim',
    'akinsho/bufferline.nvim',
    'akinsho/toggleterm.nvim',
    'alker0/chezmoi.vim', -- chezmoi syntax
    'christoomey/vim-tmux-navigator',
    'dhruvasagar/vim-table-mode',
    'folke/trouble.nvim',
    'folke/which-key.nvim',
    'kevinhwang91/rnvimr',  -- Ranger
    'kyazdani42/nvim-web-devicons',
    'kylechui/nvim-surround',
    'lewis6991/impatient.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'mbbill/undotree', -- undo tree
    'moll/vim-bbye',
    'numToStr/Comment.nvim',
    'nvim-lua/plenary.nvim', -- Useful lua functions used by lots of plugins
    'nvim-treesitter/nvim-treesitter',
    'theprimeagen/harpoon',
    'tomiis4/Hypersonic.nvim', -- REGEX Build and test
    'wakatime/vim-wakatime',
    'windwp/nvim-autopairs', -- Autopairs, integrates with both cmp and treesitter

    -- neorg 
    {
        'nvim-neorg/neorg',
        build = ":Neorg sync-parsers",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-neorg/neorg-telescope',
        },
    },

    -- Orgmode
    {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup{}
        end
    },

    -- Ansible 
    'pearofducks/ansible-vim',

    --Noice
    'folke/noice.nvim',
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',


    -- Cmp 
    'hrsh7th/nvim-cmp', -- The completion plugin
    'hrsh7th/cmp-buffer', -- buffer completions
    'hrsh7th/cmp-path', -- path completions
    'hrsh7th/cmp-cmdline', -- path completions
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip', -- snippet completions

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
    }, --snippet engine

    'rafamadriz/friendly-snippets', -- a bunch of snippets to use

    -- LSP

    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
    },

    -- Go Language
    {
        'fatih/vim-go',
        build = "GoUpdateBinaries",
    },
    -- Obsidian
    {
        'epwalsh/obsidian.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'hrsh7th/nvim-cmp',
            'nvim-telescope/telescope.nvim',
            'godlygeek/tabular',
            'preservim/vim-markdown',
        },
    },

    -- Git
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

}
