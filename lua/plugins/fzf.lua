-- potential telescope replacment

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      "fzf-native",
    })
  end,
}
