return {
  "zk-org/zk-nvim",
  cmd = {
    "ZkIndex",
    "ZkNew",
    "ZkNotes",
    "ZkNewFromTitleSelection",
    "ZkNewFromContentSelection",
    "ZkCd",
    "ZkLinks",
    "ZkBacklinks",
    "ZkInsertLink",
    "ZkMatch",
    "ZkTags",
  },
  config = function()
    require("zk").setup({
      picker = "fzf_lua",
      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
          -- on_attach = ...
          -- etc, see `:h vim.lsp.start_client()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })
  end,
}
