-- orgmode
local installed, Orgmode = pcall(require, "orgmode")
if not installed then
    vim.notify("Plugin 'Orgmode' is not installed")
    return
end

require("orgmode").setup_ts_grammar()

Orgmode.setup({
    org_agenda_files = { "~/Nextcloud/Notes/org/*" },
    org_default_notes_file = "~/Nextcloud/Notes/org/orgzly/inbox.org",
})
