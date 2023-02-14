return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "LinArcX/telescope-env.nvim",
    "ghassan0/telescope-glyph.nvim",
    "keyvchan/telescope-find-pickers.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "jvgrootveld/telescope-zoxide"
  },
  config = function ()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'env')
    pcall(require('telescope').load_extension, 'file_browser')
    pcall(require('telescope').load_extension, 'find_pickers')
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'glyph')
    pcall(require('telescope').load_extension, 'media_files')
    pcall(require('telescope').load_extension, 'zoxide')
    pcall(require('telescope').load_extension, 'luasnip')
  end
}

