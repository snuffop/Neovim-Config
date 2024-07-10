-- Neorg

local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  dependencies = {
    "luarocks.nvim",
    "nvim-neorg/neorg-telescope",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "max397574/neorg-contexts",
    "benlubas/neorg-conceal-wrap",
    "pritchett/neorg-capture",
    "nvim-cmp",
    "mason.nvim",
    "plenary.nvim",
    {
      "pysan3/neorg-templates",
      dependencies = {
        "L3MON4D3/LuaSnip",
      },
    },
  },

  cmd = "Neorg",
}

local function load_plugins()
  return {
    ["core.concealer"] = {
      config = {
        folds = true,
        icon_preset = "diamond",
        icons = { code_block = { spell_check = false } },
      },
    },
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
        name = "[Neorg]",
      },
    },
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/Nextcloud/Neorg",
        },
        default_workspace = "notes",
        index = "index.norg",
      },
    },
    ["core.dirman.utils"] = {},
    ["core.export"] = {
      config = {
        export_dir = "~/Nextcloud/Neorg/Export/<language>-export",
      },
    },
    ["core.qol.toc"] = {},
    ["core.qol.todo_items"] = {},
    ["core.queries.native"] = {},
    ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
    ["core.export.markdown"] = { config = { extensions = "all" } },
    ["core.esupports.indent"] = {},
    ["core.tangle"] = { config = { report_on_empty = false } },
    ["core.esupports.hop"] = {},
    ["core.esupports.metagen"] = {
      config = {
        author = "marty buchaus",
        type = "none", -- none, auto, empty options
        update_date = true,
      },
    },
    ["core.itero"] = {},
    ["core.journal"] = {
      config = {
        strategy = "nested",
        workspace = "notes",
      },
    },
    ["core.keybinds"] = {},
    ["core.looking-glass"] = {},
    ["core.summary"] = {},
    ["core.syntax"] = {},
    ["core.ui.calendar"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.integrations.nvim-cmp"] = {},
    ["core.integrations.image"] = {},
    ["core.integrations.telescope"] = {
      config = {
        insert_file_link = {
          show_title_preview = true,
        },
      },
    },
    ["external.templates"] = {
      config = {
        keywords = require("config.templates"),
        default_subcommand = "add", -- or "add" "fload", "load"
        -- snippets_overwrite = {},
      },
    },
    ["external.conceal-wrap"] = {},
    ["external.context"] = {},

    -- Capture
    ["external.capture"] = {
      config = {
        templates = {
          {
            description = "Example", -- What will be shown when invoked
            name = "example", -- Name of the neorg-templates template.
            file = "example", -- Name of the target file for the caputure. With or without `.norg` suffix
            -- Can be a function. If a full filepath is given, thats where it will be save.
            -- If just a filename, it will be saved into your workspace.

            enabled = function() -- Either a function or boolean value. Default is true.
              return true -- If false, it will not be shown in the list when invoked.
            end,

            datetree = true, -- Save the capture into a datetree. Default is false

            headline = "Example", -- If set, will save the caputure under this headline
            path = { "Save", "Here" }, -- List of headlines to traverse, then save the capture under
            -- A query for where to place the capture. Must be named neorg-capture-target
            query = "(headline1) @neorg-capture-target",
          },
          {
            descriiption = "People",
            name = "people",
            file = "people",

            enabled = function() -- Either a function or boolean value. Default is true.
              return true -- If false, it will not be shown in the list when invoked.
            end,

            headline = "People", -- If set, will save the caputure under this headline
            path = { "Save", "Here" }, -- List of headlines to traverse, then save the capture under
            -- A query for where to place the capture. Must be named neorg-capture-target
            query = "(headline1) @neorg-capture-target",
          },
        },
      },
    },
  }
end

M.config = function()
  require("neorg").setup({
    load = load_plugins(),
  })
end

return M
