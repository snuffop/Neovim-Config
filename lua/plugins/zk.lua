local M = {
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
    "ZkInsertLinkFromSelection",
    "ZkMatch",
    "ZkTags",
  },
}

M.config = function()
  local zk = require("zk")
  local commands = require("zk.commands")
  require("zk").setup({
    picker = "fzf_lua",
    lsp = {
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
    commands.add("ZkOrphans", function(options)
      options = vim.tbl_extend("force", { orphan = true }, options or {})
      zk.edit(options, { title = "Zk Orphans" })
    end),
  })
end

return M
