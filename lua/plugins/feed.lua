--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯
-- Location https://github.com/neo451/feed.nvim

return {
    "neo451/feed.nvim",
    cmd = "Feed",
    opts = {
        feeds = {
            "https://neovim.io/news.xml",
        },
    },
}
