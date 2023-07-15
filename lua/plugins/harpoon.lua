return {
    'theprimeagen/harpoon',
    cmd = "Harpoon",
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require("harpoon.mark").setup{}
        require("harpoon.ui").setup{}
    end,
}
