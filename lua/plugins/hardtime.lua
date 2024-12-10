--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {
    "m4xshen/hardtime.nvim",
    dependencies = { 
        "MunifTanjim/nui.nvim", 
        "nvim-lua/plenary.nvim" 
    },
    lazy = false,
    opts = {
        disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
    }
}
