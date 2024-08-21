return{
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
        -- Setup orgmode
        require('orgmode').setup({
            org_agenda_files = '~/Nextcloud/Notes/org/orgzly/**/*',
            org_default_notes_file = '~/Nextcloud/Notes/org/orgzly/inbox.org',
        })

    end,
}
