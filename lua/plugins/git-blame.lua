--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- Git Blame

return {
    "f-person/git-blame.nvim",
    cmd = {
        "GitBlameToggle",
        "GitBlameEnable",
        "GitBlameDisable",
        "GitBlameOpenCommitURL",
        "GitBlameCopySHA",
        "GitBlameCopyCommitURL",
        "GitBlameOpenFileURL",
        "GitBlameCopyFileURL",
    },
    config = function()
        require("gitblame").setup({
            enabled = false,
        })
    end,
}
