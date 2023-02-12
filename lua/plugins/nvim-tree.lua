return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  tag = 'nightly',

  config = function ()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup {
      sort_by = "case_sensitive",
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        group_empty = true,
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 35,
        side = "left",
        mappings = {
          list = {
            { key = { "l", "<CR>", "o" }, action = "edit" },
            { key = "h", action = "close_node" },
            { key = "v", action = "vsplit" },
            { key = "H", action = "collapse_all"}
          },
        },
      },
    }
  end
}
