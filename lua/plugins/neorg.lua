-- Neorg

local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  version = false,
  dependencies = {
    "luarocks.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-cmp",
    "mason.nvim",
    "plenary.nvim",
    -- "image.nvim",
    -- external modules
    "laher/neorg-exec",
    { "pysan3/neorg-templates-draft", dependencies = { "L3MON4D3/LuaSnip" } },
    { "nvim-neorg/neorg-telescope", dependencies = { "nvim-telescope/telescope.nvim" } },
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

local function list_workspaces(w_dirs)
  local res = {}
  for _, w in ipairs(w_dirs) do
    res[w] = "~/Nextcloud/" .. w
  end
  return res
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
    --["core.ui.calendar"] = {},
    ["core.integrations.telescope"] = {},
    ["core.integrations.treesitter"] = {},
    ["external.templates"] = {
      config = {
        templates_dir = vim.fn.stdpath("config") .. "/templates/neorg",
        keywords = require("norg-config.templates"),
        -- default_subcommand = "add", -- or "fload", "load"
        -- snippets_overwrite = {},
      },
    },
    ["external.exec"] = {},
  }
end

M.config = function()
  require("neorg").setup({
    load = load_plugins(),
  })
end

return M
