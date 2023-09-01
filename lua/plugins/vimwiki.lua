return {
    {
        'vimwiki/vimwiki',
        lazy = false,
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = '~/Nextcloud/Vimwiki',
                    syntax = 'markdown',
                    ext = '.md',
                    ignoreFolders = { 'node_modules', '.git' },
                }
            }
            vim.g.vimwiki_markdown_link_ext = 1
        end,
    },
    {
        'mattn/calendar-vim',
        lazy = false,
    },
    {
        'michal-h21/vimwiki-sync',
        lazy = false,
        init = function()
            vim.g.vimwiki_sync_branch = "main"
            vim.g.vimwiki_sync_commit_message = 'Auto commit + push. %c'
        end,
    },
    {
        'tools-life/taskwiki',
        lazy = false,
        init = function()
            vim.g.taskwiki_markup_syntax = 'markdown'
        end,
    },
}
