--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "saghen/blink.cmp",
    dependencies = { 
        -- "obsidian-nvim/obsidian.nvim",
        "saghen/blink.compat",
    },
    opts = {
        sources = {
            compat = { "obsidian", "obsidian_new", "obsidian_tags" },
        },
        keymap = {
            preset = "enter",
            ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        },
        completion = {
            list = {
                selection = "auto_insert",
            }
        },
    },
}
