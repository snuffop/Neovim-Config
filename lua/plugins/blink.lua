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
        keymap = {
            preset = "super-tab"
        },
        -- README also notes: 'you may want to set `completion.trigger.show_in_snippet = false`
        -- or use `completion.list.selection = "manual" | "auto_insert"`'
        completion = {
            list = {
                selection = "auto_insert" 
            } 
        } 
    },
}
