return {
  {
    "mickael-menu/zk-nvim",
    ft = { "markdown" },
    config = function()
      require("telescope").load_extension("zk")
      require("zk").setup({
        picker = "telescope",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end,
  },
}
