--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯


return {
    'duckdm/neowarrior.nvim',
    lazy = false,
    dependencies = {
        'nvim-telescope/telescope.nvim',
        'folke/noice.nvim',
    },

    config = function()

        local nw = require('neowarrior')
        nw.setup({
            report = "next",
        })

        vim.keymap.set("n", "<leader>mtl", function() nw.open_left() end, { desc = "Open nwarrior on the left side" })
        vim.keymap.set("n", "<leader>mtc", function() nw.open_current() end, { desc = "Open nwarrior below current buffer" })
        vim.keymap.set("n", "<leader>mtb", function() nw.open_below() end, { desc = "Open nwarrior below current buffer" })
        vim.keymap.set("n", "<leader>mta", function() nw.open_above() end, { desc = "Open nwarrior above current buffer" })
        vim.keymap.set("n", "<leader>mtr", function() nw.open_right() end, { desc = "Open nwarrior on the right side" })
        vim.keymap.set("n", "<leader>mtt", function() nw.focus() end, { desc = "Focus nwarrior" })
    end
}
