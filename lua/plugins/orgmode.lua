-- orgmode
require('orgmode').setup_ts_grammar()

require('orgmode').setup({
    org_agenda_files = { "~/Nextcloud/Notes/org/*" },
    org_default_notes_file = "~/Nextcloud/Notes/org/orgzly/inbox.org",
})
