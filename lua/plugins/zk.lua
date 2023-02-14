-- https://github.com/mickael-menu/zk-nvim
return {
  "mickael-menu/zk-nvim",
  lazy = true,
  dependencies = {
    "mattn/calendar-vim",
    "majutsushi/tagbar",
  },
  config = function ()
    require('zk').setup {

      -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
      -- it's recommended to use "telescope" or "fzf"
      picker = "telescope",

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
    }
  end
}
