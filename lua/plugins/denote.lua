--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "snuffop/vim-denote-md",
    cmd = { 
        "DenoteNewNote",
        "DenoteChangeTitle",
        "DenoteChangeTags",
        "DenotePutNotesListForTags",
        "DenotePutNoteActionsForTags",
        "DenotePutNoteBacklinksForBuffer",
        "DenoteFollowLink",
    },
    config = function() 
        vim.cmd([[
        let g:denote_md_script = $DENOTE_MD_SCRIPT_PATH

        if filereadable(g:denote_md_script)
        nnoremap <Leader>ndn :DenoteNewNote<CR>
        nnoremap <Leader>ndt :DenoteChangeTitle<CR>
        nnoremap <Leader>ndg :DenoteChangeTags<CR>
        nnoremap <Leader>ndl :DenotePutNotesListForTags<CR>
        nnoremap <Leader>nda :DenotePutNoteActionsForTags<CR>
        nnoremap <Leader>ndb :DenotePutNoteBacklinksForBuffer<CR>
        nnoremap <Leader>ndf :DenoteFollowLink<CR>
        endif
        ]])
    end,
}

