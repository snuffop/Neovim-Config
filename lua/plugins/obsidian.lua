-- Obsidian Config

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

    completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
    },
})

