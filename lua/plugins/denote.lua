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
        ]])
    end,
}

