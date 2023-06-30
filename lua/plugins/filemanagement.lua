return {
  {
    'is0n/fm-nvim',
    lazy = false,
    config = function()
    require('fm-nvim').setup({
      mappings = {
        ESC        = ":q<CR>"
      },
    })
  end,
  },

  -- Ranger
  -- {'francoiscabrol/ranger.vim'},
  -- {'rbgrouleff/bclose.vim'},  -- dependency for ranger

  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
      vim.g.rnvimr_enable_ex = 1
      vim.g.rnvimr_hide_gitignore = 1
    end,
  }
}
