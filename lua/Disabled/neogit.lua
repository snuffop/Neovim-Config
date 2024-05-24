-- Neogit
--
return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    require("neogit").setup({
      integrations = {
        diffview = true,
        telescope = true,
        fzf_lua = true,
      },
    })
  end,
}
