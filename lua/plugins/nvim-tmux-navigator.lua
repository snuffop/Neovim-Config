return {
  "alexghergh/nvim-tmux-navigation",
  cmd = {
    "NvimTmuxNavigateLeft",
    "NvimTmuxNavigateDown",
    "NvimTmuxNavigateUp",
    "NvimTmuxNavigateRight",
  },

  config = function()
    local nvim_tmux_nav = require("nvim-tmux-navigation")

    nvim_tmux_nav.setup({
      disable_when_zoomed = true, -- defaults to false
    })
  end,
}
