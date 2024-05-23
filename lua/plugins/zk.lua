-- https://github.com/zk-org/zk-nvim
return {
  "zk-org/zk-nvim",
  cmd = {
    "ZkNotes",
    "ZkTags",
    "ZkNew",
    "ZkLinks",
  },
  config = function()
    require("zk").setup({
      picker = "telescope",

      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
          root_dir = "~/Nextcloud/ZK",
        },

        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })
  end,
}
