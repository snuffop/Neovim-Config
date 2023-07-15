--- Core plugins to split out

return {

    'JoosepAlviste/nvim-ts-context-commentstring',
    'alker0/chezmoi.vim', -- chezmoi syntax
    'dhruvasagar/vim-table-mode',
    'kyazdani42/nvim-web-devicons',
    'kylechui/nvim-surround',
    'lewis6991/impatient.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'mbbill/undotree', -- undo tree
    'moll/vim-bbye',
    'numToStr/Comment.nvim',
    'nvim-lua/plenary.nvim', -- Useful lua functions used by lots of plugins
    'wakatime/vim-wakatime',

    -- Ansible 
    'pearofducks/ansible-vim',

    -- Cmp 
    'hrsh7th/nvim-cmp', -- The completion plugin
    'hrsh7th/cmp-buffer', -- buffer completions
    'hrsh7th/cmp-path', -- path completions
    'hrsh7th/cmp-cmdline', -- path completions
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

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

    -- Git
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

}
