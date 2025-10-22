--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    'duckdm/neowarrior.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        --- Optional but recommended for nicer inputs
        --- 'folke/noice.nvim',
    },
    config = function()

        local nw = require('neowarrior')
        local home = vim.env.HOME
        nw.setup({
            report = "next",
            filter = "\\(due.before:2d or due: \\)",
            dir_setup = {
                {
                    dir = home .. "/dev/nvim/neowarrior.nvim",
                    filter = "project:neowarrior",
                    mode = "tree",
                    expanded = true,
                },
            }
        })
        vim.keymap.set("n", "<leader>Tl", function() nw.open_left() end, { desc = "Open nwarrior on the left side" })
        vim.keymap.set("n", "<leader>Tc", function() nw.open_current() end, { desc = "Open nwarrior below current buffer" })
        vim.keymap.set("n", "<leader>Tb", function() nw.open_below() end, { desc = "Open nwarrior below current buffer" })
        vim.keymap.set("n", "<leader>Ta", function() nw.open_above() end, { desc = "Open nwarrior above current buffer" })
        vim.keymap.set("n", "<leader>Tr", function() nw.open_right() end, { desc = "Open nwarrior on the right side" })
        vim.keymap.set("n", "<leader>Tt", function() nw.focus() end, { desc = "Focus nwarrior" })
    end
}
