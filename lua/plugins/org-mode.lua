--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { "org" },
        config = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>o", group = "Orgmode" },
                { "<leader>oa", group = "Agenda" },
                { "<leader>oc", group = "Capture" },
                { "<leader>od", group = "Deadline/Schedule" },
                { "<leader>oi", group = "Insert" },
                { "<leader>ol", group = "Links" },
                { "<leader>ot", group = "TODO/Tags" },
                { "<leader>ox", group = "Checkbox" },
            })

            require("orgmode").setup({
                org_agenda_files = { "~/Nextcloud/Org/**/*", "~/Orgzly/**/*" },
                org_default_notes_file = "~/Orgzly/Inbox.org",
                org_todo_keywords = { "TODO", "WAITING", "IN-PROGRESS", "|", "DONE", "CANCELLED" },
                org_hide_leading_stars = true,
                org_startup_folded = "overview",
                org_ellipsis = "…",
                org_agenda_span = "week",
                org_capture_templates = {
                    i = { description = "Inbox", template = "** %?", target = "~/Orgzly/Inbox.org", headline = "Inbox" },
                    d = { description = "Default", template = "%?", target = "~/Nextcloud/Org/Resources/%<%Y%m%d%H%M%S>-${slug}.org", headline = "${title}" },
                    j = { description = "Joyent Project", template = "%?", target = "~/Nextcloud/Org/Area/Joyent/%<%Y%m%d%H%M%S>-${slug}.org", headline = "${title}" },
                    J = { description = "Joyent Jira", template = "%?", target = "~/Nextcloud/Org/Area/Joyent/Jira/%<%Y%m%d%H%M%S>-${slug}.org", headline = "${title}" },
                    p = { description = "Project", template = "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n", target = "~/Nextcloud/Org/Project/%<%Y%m%d%H%M%S>-${slug}.org", headline = "${title}" },
                    P = { description = "People", template = "%?", target = "~/Nextcloud/Org/Resources/People/%<%Y%m%d%H%M%S>-${slug}.org", headline = "${title}" },
                    t = { description = "Tip Jar", template = "%?", target = "~/Nextcloud/Org/Resources/TipJar/%<%Y%m%d%H%M%S>-${slug}.org", headline = "${title}" },
                },
                org_refile_targets = { "~/Nextcloud/Org/**/*" },
                org_tag_alist = { "Project", "Jira", "people", "tipjar", "daily" },
            })
        end,
    },

    {
        "akinsho/org-bullets.nvim",
        ft = { "org" },
        config = function()
            require("org-bullets").setup({
                concealcursor = true,  -- Hide bullets on current line (cleaner look)
                symbols = {
                    headlines = { "◉", "○", "✸", "✿" },  -- Pretty headline bullets
                    checkboxes = {
                        half = { "-", "Half " },
                        done = { "✓", "Done " },
                        todo = { "✗", "Todo " },
                    },
                },
            })
        end,
    },
    {
        "chipsenkbeil/org-roam.nvim",
        dependencies = { "nvim-orgmode/orgmode" },
        ft = { "org" },
        config = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>n", group = "Org-Roam" },
                { "<leader>nd", group = "Dailies" },
            })

            require("org-roam").setup({
                directory = "~/Nextcloud/Org",
                daily_note_format = "%Y-%m-%d",
            })
        end,
    },
}
