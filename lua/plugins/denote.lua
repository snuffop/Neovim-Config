--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯


-- my denote 

return {
    "snuffop/denote-nvim",
    cmd = {
        "Denote",
    },
    opts = {
        ext = "md",             -- Note file extension (e.g. md, org, norg, txt)
        dir = "~/zettelkasten", -- Notes directory (should already exist)
        add_heading = true,     -- Add a md/org heading to new notes
        retitle_heading = true, -- Replace the first line heading when retitling
    },
}

-- return {
--     "shuckster/vim-denote-md",
--     lazy = false,
--     config = function()
--
--         vim.cmd([[
--         " Define where your denote-md script is located
--         let g:denote_md_script = $DENOTE_MD_SCRIPT_PATH
--
--         " Add your denote-md remaps
--         if filereadable(g:denote_md_script)
--         nnoremap <Leader>ndn :DenoteNewNote<CR>
--         nnoremap <Leader>ndt :DenoteChangeTitle<CR>
--         nnoremap <Leader>ndg :DenoteChangeTags<CR>
--         nnoremap <Leader>ndl :DenotePutNotesListForTags<CR>
--         nnoremap <Leader>nda :DenotePutNoteActionsForTags<CR>
--         nnoremap <Leader>ndb :DenotePutNoteBacklinksForBuffer<CR>
--         nnoremap <Leader>ndf :DenoteFollowLink<CR>
--         endif
--     ]])
--     end
-- }
