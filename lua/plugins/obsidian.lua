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
                    name = "default",
                    path = "~/Nextcloud/Obsidian/default",
                },
            },

            daily_notes = {
                folder = "journals",
                date_format = "%Y/%m-%B/%Y-%m-%d-%A",
                default_tags = { "journal" },
                template = "journal.md",
            },

            templates = {
                subdir = "templates",
                substitutions = {
                    yesterday = function()
                        return os.date("%Y-%m-%d", os.time() - 86400)
                    end
                },
            },

            notes_subdir = "notes",
            new_notes_location = "INBOX",

            completion = {
                nvim_cmp = true,
                min_chars = 2,
            },

            -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
            -- URL it will be ignored but you can customize this behavior here.
            ---@param url string
            follow_url_func = function(url)
                -- Open the URL in the default web browser.
                -- vim.fn.jobstart({"open", url})  -- Mac OS
                vim.fn.jobstart({ "xdg-open", url }) -- linux
            end,

            picker = {
                -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
                name = "telescope.nvim",
                note_mappings = {
                    -- Create a new note from your query.
                    new = "<C-x>",
                    -- Insert a link to the selected note.
                    insert_link = "<C-S-l>",
                },
                tag_mappings = {
                    -- Add tag(s) to current note.
                    tag_note = "<C-x>",
                    -- Insert a tag at the current location.
                    insert_tag = "<C-S-l>",
                },
            },

            attachments = {
                img_folder = "assets/images",
            },
            ui = {
                enable = true,  -- set to false to disable all additional syntax features
                update_debounce = 200,  -- update delay after a text change (in milliseconds)
                max_file_length = 5000,  -- disable UI features for files with more than this many lines
                -- Define how various check-boxes are displayed
                checkboxes = {
                    -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                    ["!"] = { char = "", hl_group = "ObsidianImportant" },
                    -- Replace the above with this if you don't have a patched font:
                    -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                    -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                    -- You can also add more custom ones...
                },
                -- Use bullet marks for non-checkbox lists.
                bullets = { char = "•", hl_group = "ObsidianBullet" },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                -- Replace the above with this if you don't have a patched font:
                -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                block_ids = { hl_group = "ObsidianBlockID" },
                hl_groups = {
                    -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#89ddff" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianImportant = { bold = true, fg = "#d73128" },
                    ObsidianBullet = { bold = true, fg = "#89ddff" },
                    ObsidianRefText = { underline = true, fg = "#c792ea" },
                    ObsidianExtLinkIcon = { fg = "#c792ea" },
                    ObsidianTag = { italic = true, fg = "#89ddff" },
                    ObsidianBlockID = { italic = true, fg = "#89ddff" },
                    ObsidianHighlightText = { bg = "#75662e" },
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
