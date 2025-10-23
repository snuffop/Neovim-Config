--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "alexghergh/nvim-tmux-navigation",
    cmd = {
        "NvimTmuxNavigateLeft",
        "NvimTmuxNavigateDown",
        "NvimTmuxNavigateUp",
        "NvimTmuxNavigateRight",
    },
    keys = {
      -- Switch to other tmux panes not only when in normal mode, but also
      -- insert and visual mode
      { "<C-h>", '<cmd>NvimTmuxNavigateLeft<cr>', mode = { "n", "v", "i" }, desc = "TmuxNavigateLeft" },
      { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", mode = { "n", "v", "i" }, desc = "TmuxNavigateDown" },
      { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", mode = { "n", "v", "i" }, desc = "TmuxNavigateUp" },
      { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", mode = { "n", "v", "i" }, desc = "TmuxNavigateRight" },
      { "<C-\\>", "<cmd>NvimTmuxNavigatePrevious<cr>", mode = { "n", "v", "i" }, desc = "TmuxNavigatePrevious" },
      { "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>", mode = { "n", "v", "i" },  desc = "Tmux Next" },
    },
    config = function()
        local nvim_tmux_nav = require("nvim-tmux-navigation")

        nvim_tmux_nav.setup({
            disable_when_zoomed = true, -- defaults to false
        })
    end,
}
