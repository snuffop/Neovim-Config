--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- Obsidian epwalsh version

return {
    "epwalsh/obsidian.nvim",
    version = "*", -- Recommended, use latest release instead of latest commit
    cmd = {
        "ObsidianBacklinks",
        "ObsidianDailies",
        "ObsidianLink",
        "ObsidianNew",
        "ObsidianOpen",
        "ObsidianQuickSwitch",
        "ObsidianRename",
        "ObsidianSearch",
        "ObsidianTags",
        "ObsidianTemplate",
        "ObsidianToday",
        "ObsidianTomorrow",
        "ObsidianYesterday",
    },

    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "Nextcloud/Obsidian/default/*.md",
        "BufNewFile " .. vim.fn.expand("~") .. "Nextcloud/Obsidian/default/*.md",
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("obsidian").setup({

            workspaces = {
                {
                    name = "default",
                    path = "~/Nextcloud/Obsidian/default",
                },
            },

            daily_notes = {
                folder = "Journals",
                date_format = "%Y/%m-%B/%Y-%m-%d-%A",
                default_tags = { "journal" },
                template = "journal.md",
            },

            templates = {
                subdir = "Templates",
                substitutions = {
                    yesterday = function()
                        return os.date("%Y-%m-%d", os.time() - 86400)
                    end
                },
            },

            notes_subdir = "Notes",
            new_notes_location = "Inbox",
            preferred_link_style = "markdown",

            completion = {
                nvim_cmp = true,
                min_chars = 2,
                new_notes_location = "current_dir",
                prepend_note_id = true,
            },
            ---@param url string
            follow_url_func = function(url)
                vim.fn.jobstart({ "xdg-open", url }) -- linux
            end,

            attachments = {
                img_folder = "Assets/images",
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

            ---@param note string|?
            ---@return string
            note_frontmatter_func = function(note)
                local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }
                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end,
        })
    end,
}
