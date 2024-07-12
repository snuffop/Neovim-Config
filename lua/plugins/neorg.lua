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
  build = ":Neorg sync-parsers",
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
        author = "mbuchaus",
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

-- local neorg_loaded, neorg = pcall(require, "neorg.core")
-- assert(neorg_loaded, "Neorg is not loaded - please make sure to load Neorg first")
-- local fzf_lua_loaded, fzf_lua = pcall(require, "fzf-lua")
-- assert(fzf_lua_loaded, "fzf-lua is not loaded - please make sure to load fzf-lua first")
-- local builtin = require("fzf-lua.previewer.builtin")
--
-- local function neorg_node_injector()
--     local current_workspace = neorg.modules.get_module("core.dirman").get_current_workspace()
--
--     local base_directory = current_workspace[2]
--     -- IMP: CHANGE FDFIND and RG here according to your preferred tool
--     local norg_files_output = vim.fn.systemlist("fdfind -e norg --type f --base-directory " .. base_directory)
--     local norg_files = table.concat(norg_files_output, " ")
--     local rg_command = 'rg --multiline "(?s)@document\\.meta.*?title:\\s+(.*?)\\s+@end" ' .. norg_files .. " " .. base_directory
--     local rg_results = vim.fn.system(rg_command)
--
--     -- Extract lines containing "title:"
--     local titles = {}
--     for line in rg_results:gmatch("[^\r\n]+") do
--         if line:find("title:") then
--             table.insert(titles, line)
--         end
--     end
--
--     -- Concatenate the filtered lines into a single string
--     local filtered_results = table.concat(titles, "\n")
--
--     local title_path_pairs = {}
--
--     -- Iterate over each line in the output
--     for line in filtered_results:gmatch("[^\r\n]+") do
--         -- Split the line into two parts based on ":"
--         local file_path, title = line:match("^(.-):(.*)$")
--         -- And again to get rid of the annoying "title"
--         _, title = title:match("^(.-): (.*)$")
--         -- Store all in a dictionary. This finna be a problem for
--         -- people with Big Chungus workspaces
--         title_path_pairs[title] = file_path
--     end
--
--     local workspace_previewer = builtin.buffer_or_file:extend()
--
--     function workspace_previewer:new(o, opts, fzf_win)
--         workspace_previewer.super.new(self, o, opts, fzf_win)
--         setmetatable(self, workspace_previewer)
--         return self
--     end
--
--     function workspace_previewer:parse_entry(entry_str)
--         return {
--             path = title_path_pairs[entry_str],
--             line = 1,
--             col = 1,
--         }
--     end
--
--     local navigate_to = function (selected)
--         vim.notify("Navigating to --> "..selected[1])
--         vim.cmd("e "..title_path_pairs[selected[1]])
--     end
--
--     local paste_address = function (selected)
--         vim.notify("Pasting address of --> "..selected[1])
--
--         -- This is necessary because the "/" in the dir address
--         -- can effect the regex-ing
--         local escaped_prefix = base_directory:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%1")
--         local relative_path = title_path_pairs[selected[1]]:gsub("^"..escaped_prefix, "")
--
--         local cursor_pos = vim.api.nvim_win_get_cursor(0)
--
--         -- Why use an if statement here, you ask?
--         -- IDFK, some OS seem to add a random '.' in the address and some don't...
--         if relative_path:sub(1,1) == "." then
--             local hyperlink = "{:$"..relative_path:sub(2,-6)..":}["..selected[1].."]"
--             vim.api.nvim_put({hyperlink}, "", true, true)
--         else
--             local hyperlink = "{:$"..relative_path:sub(1,-6)..":}["..selected[1].."]"
--             vim.api.nvim_put({hyperlink}, "", true, true)
--         end
--
--         vim.api.nvim_win_set_cursor(0, cursor_pos)
--     end
--
--     local function table_keys(tbl)
--         local keys = {}
--         for key, _ in pairs(tbl) do
--             table.insert(keys, key)
--         end
--         return keys
--     end
--
--     local prompt = "Navigate to -> "
--     fzf_lua.fzf_exec(table_keys(title_path_pairs), {
--         previewer = workspace_previewer,
--         prompt = prompt,
--         actions = {
--             ["default"] = navigate_to,
--             ["ctrl-i"] = paste_address,
--         },
--     })
--
-- end
--
-- local function neorg_workspace_selector()
--     local workspaces = neorg.modules.get_module("core.dirman").get_workspaces()
--     local workspace_names = {}
--
--     for name in pairs(workspaces) do
--         table.insert(workspace_names, name)
--     end
--
--     local workspace_previewer = builtin.buffer_or_file:extend()
--
--     function workspace_previewer:new(o, opts, fzf_win)
--         workspace_previewer.super.new(self, o, opts, fzf_win)
--         setmetatable(self, workspace_previewer)
--         return self
--     end
--
--     function workspace_previewer:parse_entry(entry_str)
--         local path = workspaces[entry_str]
--         return {
--             path = path .. "/index.norg",
--             line = 1,
--             col = 1,
--         }
--     end
--
--     local workspace_set = function (selected)
--         vim.cmd("Neorg workspace " .. selected[1])
--     end
--
--     local workspace_open = function (selected)
--         vim.cmd("Neorg workspace " .. selected[1])
--         vim.cmd("Neorg index")
--     end
--
--     local prompt = "Select Neorg Directory -> "
--     fzf_lua.fzf_exec(workspace_names, {
--         previewer = workspace_previewer,
--         prompt = prompt,
--         actions = {
--             ["default"] = workspace_set,
--             ["ctrl-i"] = workspace_open,
--         },
--     })
-- end
