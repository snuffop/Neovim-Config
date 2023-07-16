return {
    'NeogitOrg/neogit',
    cmd = "Neogit",
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require('neogit').setup {
            commit_confirmation = {
                enabled = true,
                close_on_deny = false,
            }
        }
    end
}
