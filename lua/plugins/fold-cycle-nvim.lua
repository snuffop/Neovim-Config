--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "jghauser/fold-cycle.nvim",
    ft = { "markdown" },
    config = function()
        local fc = require("fold-cycle")
        fc.setup()

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true, nowait = true, desc = "Fold cycle" }
                vim.keymap.set("n", "<Tab>",   fc.open,  opts)  -- cycle/open
                vim.keymap.set("n", "<S-Tab>", fc.close, opts)  -- reverse/close
            end,
        })
    end,
}
