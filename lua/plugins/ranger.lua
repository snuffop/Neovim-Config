--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯
-- Ranger

return {
    "kelly-lin/ranger.nvim",
    lazy = false,
    config = function()
        require("ranger-nvim").setup({ replace_netrw = true })
        vim.api.nvim_set_keymap("n", "<leader>fm", "", {
            noremap = true,
            callback = function()
                require("ranger-nvim").open(true)
            end,
        })
    end,
}
