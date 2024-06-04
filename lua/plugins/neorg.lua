-- Neorg

local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  version = false,
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
    "laher/neorg-exec",
    {
      "pysan3/neorg-templates",
      dependencies = {
        "L3MON4D3/LuaSnip",
      },
    },
  },

  -- build = ":Neorg sync-parsers",
  cmd = "Neorg",
  default_workspace = "notes",
  aug = vim.api.nvim_create_augroup("NorgAuG", { clear = true }),
}

M.popup = nil
M.bufnr = nil
M.open_index_in_popup = function()
  if not M.popup then
    M.popup = require("nui.popup")({
      bufnr = M.bufnr,
      size = { width = "80%", height = "90%" },
      position = { col = "50%", row = "50%" },
      enter = true,
      focusable = true,
      relative = "editor",
      border = {
        style = "rounded",
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:WinSeparator",
      },
    })
  end

  vim.api.nvim_create_autocmd("WinEnter", {
    group = M.aug,
    pattern = "*.norg",
    callback = function()
      if vim.api.nvim_get_current_win() == M.popup.winid then
        vim.keymap.set({ "n", "i", "v" }, "<C-q>", function()
          vim.cmd.write()
          M.popup:hide()
        end, { buffer = M.popup.bufnr, remap = false })
      end
    end,
  })

  vim.api.nvim_create_autocmd("WinLeave", {
    group = M.aug,
    callback = function(args)
      if vim.api.nvim_get_current_win() == M.popup.winid then
        M.bufnr = args.buf
        M.popup:hide()
      end
    end,
  })

  if M.bufnr and vim.api.nvim_buf_is_valid(M.bufnr) then
    M.popup.bufnr = M.bufnr
  end

  M.popup:mount()
  M.popup:show()

  if vim.bo[vim.api.nvim_win_get_buf(M.popup.winid)].filetype ~= "norg" then
    vim.cmd.edit("index.norg")
  end
end

M.keys = {
  { ",ni", "<Cmd>Neorg index<CR>" },
  { "<Leader>tt", M.open_index_in_popup, desc = "Open Neorg index in a popup window" },
}

M.init = function()
  require("norg-config.commands").setup({})
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = M.aug,
    pattern = "*.norg",
    command = "Neorg tangle current-file",
  })
end

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
        name = "[Norg]",
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
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<leader><leader>",
      },
    },
    ["core.looking-glass"] = {},
    ["core.summary"] = {},
    ["core.syntax"] = {},
    ["core.ui.calendar"] = {},
    ["core.integrations.telescope"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.integrations.nvim-cmp"] = {},
    ["core.integrations.image"] = {},
    ["external.templates"] = {
      config = {
        keywords = require("norg-config.templates"),
        -- default_subcommand = "add", -- or "fload", "load"
        -- snippets_overwrite = {},
      },
    },
    ["external.exec"] = {},
    ["external.conceal-wrap"] = {},
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

    ["external.context"] = {},
  }
end

M.config = function()
  require("neorg").setup({
    load = load_plugins(),
  })
end

return M
