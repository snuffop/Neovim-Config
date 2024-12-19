--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "saghen/blink.cmp",
    opts = {
        sources = {
            compat = {
                "obsidian",
                "obsidian_new",
                "obsidian_tags",
            }
        }
    }
}
