-- OIL
return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      {
        "echasnovski/mini.icons",
        opts = {},
      },
    },
    cmd = "Oil",
    config = function()
      require("oil").setup({
        columns = {
          -- "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },

        default_file_explorer = true,
        restore_win_options = true,
        delete_to_trash = true,
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
        },

        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 10,
          },
          preview_split = "auto",
          override = function(conf)
            return conf
          end,
        },
      })
    end,
  },
}
