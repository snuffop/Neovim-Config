--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "amitds1997/remote-nvim.nvim",
    lazy = false,
    version = "*", -- Pin to GitHub releases
    dependencies = {
        "nvim-lua/plenary.nvim", -- For standard functions
        "MunifTanjim/nui.nvim", -- To build the plugin UI
        "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = function ()
        require("remote-nvim").setup({
            remote = {
                copy_dirs = {
                    config = {
                        base = vim.fn.stdpath("config"), 
                        dirs = { 
                            "lua",
                            "after",
                            "spell"
                        }, 
                        compression = {
                            enabled = true, 
                            additional_opts = { "--exclude-vcs" }, 
                        },
                    },
                },
            },
        })
    end,
}
