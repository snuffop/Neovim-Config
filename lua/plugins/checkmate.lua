--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯


return {
    "bngarren/checkmate.nvim",
    lazy = false,
    ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
    opts = {
        files = {
            "*.md",
        }
    },

}
