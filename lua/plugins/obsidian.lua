--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
  'ada0l/obsidian',
  keys = {
    {
      '<leader>ov',
      function()
        Obsidian.select_vault()
      end,
      desc = "Select Obsidian vault",
    },
    {
      '<leader>oo',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.cd_vault()
        end)
      end,
      desc = 'Open Obsidian directory',
    },
    {
      '<leader>ot',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.open_today()
        end)
      end,
      desc = 'Open today',
    },
    {
      '<leader>od',
      function()
        Obsidian.get_current_vault(function()
          vim.ui.input({ prompt = 'Write shift in days: ' }, function(input_shift)
            local shift = tonumber(input_shift) * 60 * 60 * 24
            Obsidian.open_today(shift)
          end)
        end)
      end,
      desc = 'Open daily node with shift',
    },
    {
      '<leader>on',
      function()
        Obsidian.get_current_vault(function()
          vim.ui.input({ prompt = 'Write name of new note: ' }, function(name)
            Obsidian.new_note(name)
          end)
        end)
      end,
      desc = 'New note',
    },
    {
      '<leader>oi',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.select_template('telescope')
        end)
      end,
      desc = 'Insert template',
    },
    {
      '<leader>os',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.search_note('telescope')
        end)
      end,
      desc = 'Search note',
    },
    {
      '<leader>ob',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.select_backlinks('telescope')
        end)
      end,
      desc = 'Select backlink',
    },
    {
      '<leader>og',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.go_to()
        end)
      end,
      desc = 'Go to file under cursor',
    },
    {
      '<leader>or',
      function()
        Obsidian.get_current_vault(function()
          vim.ui.input({ prompt = 'Rename file to' }, function(name)
            Obsidian.rename(name)
          end)
        end)
      end,
      desc = 'Rename file with updating links',
    },
    {
      "gf",
      function()
        if Obsidian.found_wikilink_under_cursor() ~= nil then
          return "<cmd>lua Obsidian.get_current_vault(function() Obsidian.go_to() end)<CR>"
        else
          return "gf"
        end
      end,
      noremap = false,
      expr = true
    }
  },
  opts = function()
    ---@param filename string
    ---@return string
    local transformator = function(filename)
      if filename ~= nil and filename ~= '' then
        return filename
      end
      return string.format('%d', os.time())
    end
    return {
      vaults = {
        {
          dir = '~/Documents/default/',
          daily = {
            dir = '01.daily/',
            format = '%Y-%m-%d',
          },
          templates = {
            dir = 'templates/',
            date = '%Y-%d-%m',
            time = '%Y-%d-%m',
          },
          note = {
            dir = 'notes/',
            transformator = transformator,
          },
        }
      }
    }
  end
},

-- Obsidian epwalsh version

return {
  -- "epwalsh/obsidian.nvim",
  -- version = "*", -- Recommended, use latest release instead of latest commit
  -- cmd = {
  --   "ObsidianBacklinks",
  --   "ObsidianDailies",
  --   "ObsidianLink",
  --   "ObsidianNew",
  --   "ObsidianOpen",
  --   "ObsidianQuickSwitch",
  --   "ObsidianRename",
  --   "ObsidianSearch",
  --   "ObsidianTags",
  --   "ObsidianTemplate",
  --   "ObsidianToday",
  --   "ObsidianTomorrow",
  --   "ObsidianYesterday",
  -- },
  -- event = {
  --   "BufReadPre " .. vim.fn.expand("~") .. "Nextcloud/Obsidian/default/**.md",
  --   "BufNewFile " .. vim.fn.expand("~") .. "Nextcloud/Obsidian/default/**.md",
  -- },
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  -- },
  -- config = function()
  --   require("obsidian").setup({
  --
  --     workspaces = {
  --       {
  --         name = "personal",
  --         path = "~/Nextcloud/Obsidian/default",
  --       },
  --     },
  --
  --     daily_notes = {
  --       folder = "journals",
  --       date_format = "%Y/%m-%B/%Y-%m-%d-%A",
  --       default_tags = { "journal" },
  --       template = "journals.md",
  --     },
  --
  --     templates = {
  --       subdir = "templates",
  --     },
  --
  --     notes_subdir = "Notes",
  --     new_notes_location = "INBOX",
  --
  --     completion = {
  --       nvim_cmp = true,
  --       min_chars = 2,
  --     },
  --
  --     -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  --     -- URL it will be ignored but you can customize this behavior here.
  --     ---@param url string
  --     follow_url_func = function(url)
  --       -- Open the URL in the default web browser.
  --       -- vim.fn.jobstart({"open", url})  -- Mac OS
  --       vim.fn.jobstart({ "xdg-open", url }) -- linux
  --     end,
  --
  --     picker = {
  --       -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
  --       name = "telescope.nvim",
  --       note_mappings = {
  --         -- Create a new note from your query.
  --         new = "<C-x>",
  --         -- Insert a link to the selected note.
  --         insert_link = "<C-l>",
  --       },
  --       tag_mappings = {
  --         -- Add tag(s) to current note.
  --         tag_note = "<C-x>",
  --         -- Insert a tag at the current location.
  --         insert_tag = "<C-l>",
  --       },
  --     },
  --
  --     attachments = {
  --       img_folder = "99-assets/imgs",
  --     },
  --
  --     -- Optional, customize how note IDs are generated given an optional title.
  --     ---@param title string|?
  --     ---@return string
  --     note_id_func = function(title)
  --       -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
  --       -- In this case a note with the title 'My new note' will be given an ID that looks
  --       -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
  --       local suffix = ""
  --       if title ~= nil then
  --         -- If title is given, transform it into valid file name.
  --         suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
  --       else
  --         -- If title is nil, just add 4 random uppercase letters to the suffix.
  --         for _ = 1, 4 do
  --           suffix = suffix .. string.char(math.random(65, 90))
  --         end
  --       end
  --       return tostring(os.date("%Y%m%dT%H%M%S")) .. "--" .. suffix
  --     end,
  --
  --     markdown_link_func = function(opts)
  --       return require("obsidian.util").markdown_link(opts)
  --     end,
  --
  --     preferred_link_style = "markdown",
  --   })
  -- end,
}
