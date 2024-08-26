-- github.com 

return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,      -- Recommended
        -- ft = "markdown" -- If you decide to lazy-load anyway

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "megalithic/zk.nvim",
        lazy = false,
        config = function ()
            require("zk").setup({
                debug = false,
                log = true,
                default_keymaps = true,
                default_notebook_path = vim.env.ZK_NOTEBOOK_DIR or "",
                fuzzy_finder = "fzf", -- or "telescope"
                link_format = "markdown" -- or "wiki"
            })
        end
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        enabled = false,
    },
}
