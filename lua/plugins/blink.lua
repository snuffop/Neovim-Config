--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

-- Options to override tab instead of return for accept suggestion

return {
    "saghen/blink.cmp",
    opts = function(_, opts)
        opts.keymap = vim.tbl_extend("force", opts.keymap or {}, {
            ["<Tab>"] = { "accept", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<CR>"] = {}, -- unmap Return if you don’t want it to confirm
        })
    end,
}
