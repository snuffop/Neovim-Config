--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- ZK config
return {
    "zk-org/zk-nvim",
    cmd = {
        "ZkIndex",
        "ZkNew",
        "ZkCd",
        "ZkNotes",
        "ZkBacklinks",
        "ZkLinks",
        "ZkInsertLink",
        "ZkTags",
    },
    config = function()
        require("zk").setup({
            picker = "telescope",
        })
    end
}


-- :'<,'>ZkNewFromTitleSelection [{options}]
-- :'<,'>ZkNewFromContentSelection [{options}]
-- :'<,'>ZkInsertLinkAtSelection [{options}]
-- :'<,'>ZkMatch [{options}]
