return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        'neovim/nvim-lspconfig',             -- Required
        'williamboman/mason.nvim',

        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/nvim-cmp',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',

        -- snippets
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
    }
}
