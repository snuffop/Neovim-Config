--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯
--
--  https://github.com/coffebar/neovim-project
--

return {
    "coffebar/neovim-project",
    lazy = false,
    priority = 100,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "Shatur/neovim-session-manager" },
    },

    opts = {
        projects = {
            "~/Source/*",
            "~/.config/*",
            "~/mnt/ssh/joystation/Source/Joyent/*",
            "~/Nextcloud/Org/*",
            "~/Nextcloud/Notes/*",
        },

        picker = {
            type = "snacks", -- "telescope", "fzf-lua", or "snacks"
        },

        last_session_on_startup = false, -- don’t auto-load last session
    },

    init = function()
        -- Save plugin globals in sessions (uppercase vars w/ lowercase chars)
        vim.opt.sessionoptions:append("globals")
    end,

    config = function(_, opts)
        require("neovim-project").setup(opts)

        local map = vim.keymap.set
        local opts_key = { noremap = true, silent = true }

        -- <leader>p Project commands
        map("n", "<leader>pp", "<cmd>NeovimProjectDiscover<CR>", vim.tbl_extend("force", opts_key, { desc = "Discover Projects" }))
        map("n", "<leader>pl", "<cmd>NeovimProjectLoad<CR>", vim.tbl_extend("force", opts_key, { desc = "Load Project" }))
        map("n", "<leader>ps", "<cmd>NeovimProjectSave<CR>", vim.tbl_extend("force", opts_key, { desc = "Save Project Session" }))
        map("n", "<leader>pn", "<cmd>NeovimProjectNew<CR>", vim.tbl_extend("force", opts_key, { desc = "New Project" }))
        map("n", "<leader>pd", "<cmd>NeovimProjectDelete<CR>", vim.tbl_extend("force", opts_key, { desc = "Delete Project" }))
        map("n", "<leader>pr", "<cmd>NeovimProjectReload<CR>", vim.tbl_extend("force", opts_key, { desc = "Reload Project" }))
    end,
}
