--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯
--  Site https://github.com/kawre/neotab.nvim

return {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
        -- tabkey = "",
        escape = {
            enabled = true,
            triggers = { ---@type table<string, ntab.trigger>
                ["+"] = {
                    pairs = {
                        { open = '"', close = '"' },
                    },
                    -- string.format(format, typed_char)
                    format = " %s ", -- " + "
                    ft = { "java" },
                },
                [","] = {
                    pairs = {
                        { open = "'", close = "'" },
                        { open = '"', close = '"' },
                    },
                    format = "%s ", -- ", "
                },
                ["="] = {
                    pairs = {
                        { open = "(", close = ")" },
                    },
                    ft = { "javascript", "typescript" },
                    format = " %s> ", -- ` => `
                    -- string.match(text_between_pairs, cond)
                    cond = "^$", -- match only pairs with empty content
                },
            },
        },
    },
}
