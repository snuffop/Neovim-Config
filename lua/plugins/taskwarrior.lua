--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "huantrinh1802/m_taskwarrior_d.nvim",
    version = "*",
    dependencies = { "MunifTanjim/nui.nvim" },
    lazy = false,

    config = function()
        -- Require
        require("m_taskwarrior_d").setup()
        -- Optional
        vim.api.nvim_set_keymap("n", "<leader>Te", "<cmd>TWEditTask<cr>", { desc = "TaskWarrior Edit", noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>Tv", "<cmd>TWView<cr>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>Tu", "<cmd>TWUpdateCurrent<cr>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>Ts", "<cmd>TWSyncTasks<cr>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>Tt", "<cmd>TWToggle<cr>", { noremap = true, silent = true })
        -- Be caution: it may be slow to open large files, because it scan the whole buffer
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
            group = vim.api.nvim_create_augroup("TWTask", { clear = true }),
            pattern = "*.md,*.markdown", -- Pattern to match Markdown files
            callback = function()
                vim.cmd('TWSyncTasks')
            end,
        })
    end,
}
