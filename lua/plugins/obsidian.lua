-- Obsidian epwalsh version

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
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
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
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
    })
  end,
}
