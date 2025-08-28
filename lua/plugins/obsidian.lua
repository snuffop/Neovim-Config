--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- lua/plugins/obsidian.lua

return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = false,
    ft = "markdown",
    opts = {
        workspaces = {
            {
                name = "default",
                path = "~/Obsidian"
            },
        },
        daily_notes = {
            folder = "daily",
            template = "daily.md"
        },
        templates = {
            folder = "templates",
        },
        completion = {
            nvim_cmp = false,
            blink = true,
            min_chars = 2
        },
        attachments = {
            img_folder = "media"
        },
        footer = {
            enabled = false, -- turn it off
            separator = false, -- turn it off
            -- separator = "", -- insert a blank line
            format = "{{backlinks}} backlinks  {{properties}} properties  {{words}} words  {{chars}} chars", -- works like the template system
            -- format = "({{backlinks}} backlinks)", -- limit to backlinks
            hl_group = "@property", -- Use another hl group
        },

        notes_subdir = "00-Resources",
        new_notes_location = "00-Inbox",

        -- ets how you follow URLs
        ---param url string
        folow_url_func = function(url)
            vim.fn.jobstart({ "xdg-open", url })
        end,

        -- ptional, customize how note IDs are generated given an optional title.
        ---param title string|?
        ---return string
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

        -- ptional, customize how note file names are generated given the ID, target directory, and title.
        ---param spec { id: string, dir: obsidian.Path, title: string|? }
        ---return string|obsidian.Path The full path to the new note.
        note_path_func = function(spec)
            -- This is equivalent to the default behavior.
            local path = spec.dir / tostring(spec.id)
            return path:with_suffix ".md"
        end,

        -- ptional, alternatively you can customize the frontmatter data.
        ---return table
        note_frontmatter_func = function(note)
            -- Add the title of the note as an alias.
            if note.title then
                note:add_alias(note.title)
            end

            local out = { id = note.id, aliases = note.aliases, tags = note.tags }

            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            return out
        end,
    },
    keys = {
        { "<leader>nN", "<cmd>ObsidianNew<cr>",        desc = "Notes: New note" },
        { "<leader>nd", "<cmd>ObsidianToday<cr>",      desc = "Notes: Daily" },
        { "<leader>n/", "<cmd>ObsidianSearch<cr>",     desc = "Notes: Search vault" },
        { "<leader>nn", "<cmd>lua require('snacks').picker.files{ cwd = '~/Obsidian' }<cr>", desc = "Notes: Files" },
        { "gd",         "<cmd>ObsidianFollowLink<cr>", desc = "Notes: Follow [[link]]" },

        { "<leader>nL",  "<cmd>ObsidianLinkNew<cr>",  desc = "Link New" },
        { "<leader>nT",  "<cmd>ObsidianTemplate<cr>",  desc = "Add Template" },
        { "<leader>nbb", "<cmd>ObsidianBacklinks<cr>",  desc = "Find Backlinks" },
        { "<leader>nbt", "<cmd>ObsidianBridgeTelescopeCommand<cr>",desc = "Bridge Telescope" },
        { "<leader>nbv", "<cmd>ObsidianBridgeOpenGraph<cr>",  desc = "Bridge Open Graph" },
        { "<leader>nbv", "<cmd>ObsidianBridgeOpenVaultMenu<cr>",  desc = "Bridge Vault Menu" },
        { "<leader>ndd", "<cmd>ObsidianDailies -30 2<cr>",  desc = "Open Dailies" },
        { "<leader>ndt", "<cmd>ObsidianToday<cr>",  desc = "Open Today" },
        { "<leader>ndw", "<cmd>ObsidianTomorrow<cr>",  desc = "Open Tomorrow" },
        { "<leader>ndy", "<cmd>ObsidianYesterday<cr>",  desc = "Open Yesterday" },
        { "<leader>nf",  "<cmd>ObsidianFollowLink<cr>",  desc = "Follow Link" },
        { "<leader>ng",  "<cmd>ObsidianTags<cr>",  desc = "Tags" },
        { "<leader>nl",  "<cmd>ObsidianLinks<cr>",  desc = "List Links" },
        { "<leader>nn",  "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch" },
        { "<leader>noo", "<cmd>ObsidianOpen<cr>",  desc = "Open" },
        { "<leader>noi", "<cmd>e ~/Obsidian/00-Inbox/INBOX.md<cr>",  desc = "Open INBOX" },
        { "<leader>nog", "<cmd>e ~/Obsidian/00-Inbox/Tasks.md<cr>",  desc = "Open Tasks" },
        { "<leader>nr",  "<cmd>ObsidianRename<cr>",  desc = "Rename" },
        { "<leader>ns",  "<cmd>ObsidianSearch<cr>",  desc = "Search" },
        { "<leader>nt",  "<cmd>ObsidianToggleCheckbox<cr>",  desc = "Toggle Checkbox" },
        { "<leader>nx",  "<cmd>ObsidianExtractNote<cr>",  desc = "Extract Note" },
    },
}

