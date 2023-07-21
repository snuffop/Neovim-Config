-- LSP Zero
--
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        {'honza/vim-snippets'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-cmdline'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'hrsh7th/cmp-path'},
        {'onsails/lspkind.nvim'},
        {'rafamadriz/friendly-snippets'},
        {'ray-x/cmp-treesitter'},
        {'saadparwaiz1/cmp_luasnip'},
    }
}

