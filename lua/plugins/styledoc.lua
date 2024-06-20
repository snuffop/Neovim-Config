-- styledoc
-- https://github.com/denstiny/styledoc.nvim

return {
  "denstiny/styledoc.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "vhyrro/luarocks.nvim",
    "3rd/image.nvim",
  },
  ft = "markdown",
  config = function()
    require("styledoc").setup({
      ui = {
        list = {
          enable = false,
        },
      },
    })
  end,
}
