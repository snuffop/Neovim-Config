--- Core plugins to split out

return {

    'JoosepAlviste/nvim-ts-context-commentstring',
    'alker0/chezmoi.vim', -- chezmoi syntax
    'dhruvasagar/vim-table-mode',
    'kyazdani42/nvim-web-devicons',
    'kylechui/nvim-surround',
    'lewis6991/impatient.nvim',
    'mbbill/undotree', -- undo tree
    'moll/vim-bbye',
    'nvim-lua/plenary.nvim', -- Useful lua functions used by lots of plugins
    'wakatime/vim-wakatime',

    -- Ansible 
    'pearofducks/ansible-vim',

    -- Go Language
    {
        'fatih/vim-go',
        build = "GoUpdateBinaries",
    },

    -- Git

}


