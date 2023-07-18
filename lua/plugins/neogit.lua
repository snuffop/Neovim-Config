return {
    'NeogitOrg/neogit',
    cmd = "Neogit",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
    },
    config = function()
        require('neogit').setup {
            commit_confirmation = {
                enabled = true,
                close_on_deny = false,
            },
            use_magit_keybindings = true,
            integrations = {
                diffview = true,
            },
        }
    end
}
