--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

return {
    "nvim-telescope/telescope.nvim",
    opts =  {
        defaults = {
            mappings = {
                n = {
                    ["d"] = require("telescope.actions").delete_buffer,
                    ["q"] = require("telescope.actions").close,
                },
            },
        },
    },
}
