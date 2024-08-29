
return {
    "shuckster/vim-denote-md",
    lazy = false,
    config = function()

        vim.cmd([[
        " Define where your denote-md script is located
        let g:denote_md_script = $DENOTE_MD_SCRIPT_PATH
    
        " Add your denote-md remaps
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
    end
}
