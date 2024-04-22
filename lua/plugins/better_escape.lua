-- Better Escape

return {
  "max397574/better-escape.nvim",
  lazy = false,
  config = function()
    require("better_escape").setup({
      mapping = { "jk", "jj", "kk", "kj" },
      timeout = 100,
    })
  end,
}
