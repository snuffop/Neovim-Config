return {
    'NeogitOrg/neogit',
    cmd = "Neogit",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
        'nvim-telescope/telescope.nvim',
        'ibhagwan/fzf-lua',
    },
    config = function()
        require('neogit').setup {
            commit_confirmation = {
                enabled = true,
                close_on_deny = false,
            },
            mappings = {
                status = {
                    ['p'] = "PushPopup",
                    ["F"] = "PullPopup",
                },
            },
            integrations = {
                diffview = true,
                telescope = true,
            },
        }
    end
}
