-- Obsidian epwalsh version

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  cmd = {
    "ObsidianBacklinks",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTomorrow",
    "ObsidianDailies",
    "ObsidianLink",
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianRename",
    "ObsidianSearch",
    "ObsidianTemplate",
    "ObsidianTags",
  },
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "Nextcloud/Obsidian/default/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "Nextcloud/Obsidian/default/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({

      workspaces = {
        {
          name = "personal",
          path = "~/Nextcloud/Obsidian/default",
        },
      },

      daily_notes = {
        folder = "journals",
        date_format = "%Y/%m-%B/%Y-%m-%d-%A",
        template = "journals.md",
      },

      templates = {
        subdir = "templates",
      },

      notes_subdir = "Zettelkasten",

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "telescope.nvim",
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        mappings = {
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
      },
      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.date("%Y%m%dT%H%M%S")) .. "--" .. suffix
      end,

      markdown_link_func = function(opts)
        return require("obsidian.util").markdown_link(opts)
      end,

      preferred_link_style = "markdown",
    })
  end,
}
