--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return { 
    "fnune/recall.nvim",
    lazy = false,
    config = function()
        require("recall").setup({
            sign = "",
            sign_highlight = "@comment.note",

            snacks = {
                mappings = {
                    unmark_selected_entry = {
                        normal = "d",
                        insert = "",
                    },
                },
            },
            wshada = vim.fn.has("nvim-0.10") == 0,
        })
    end
}
