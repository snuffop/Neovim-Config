--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- BLINK Obsidian  Config
return {

    "saghen/blink.cmp",
    dependencies = { 
        { "epwalsh/obsidian.nvim", "saghen/blink.compat" },
    },
    opts = {
        sources = {
            compat = { "obsidian", "obsidian_new", "obsidian_tags" },
        },
    },
}
