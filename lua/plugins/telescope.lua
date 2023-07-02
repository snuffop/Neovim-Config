return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "LinArcX/telescope-env.nvim",
      "ghassan0/telescope-glyph.nvim",
      "keyvchan/telescope-find-pickers.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "jvgrootveld/telescope-zoxide",
    },
    build = "make",
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
              ["<C-h>"] = "which_key",
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          menufacture = {
            mappings = {
              main_menu = { [{ "i", "n" }] = "<C-e>" },
            },
          },
        },
      })
      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "env")
      pcall(require("telescope").load_extension, "file_browser")
      pcall(require("telescope").load_extension, "find_pickers")
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "glyph")
      pcall(require("telescope").load_extension, "lazygit")
      pcall(require("telescope").load_extension, "luasnip")
      pcall(require("telescope").load_extension, "media_files")
      pcall(require("telescope").load_extension, "noice")
      pcall(require("telescope").load_extension, "zk")
      pcall(require("telescope").load_extension, "zoxide")
    end,
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },

    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
