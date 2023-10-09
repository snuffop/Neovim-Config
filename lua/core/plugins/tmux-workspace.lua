local workspace = require("workspace")
vim.keymap.set('n', "<leader>ps", workspace.tmux_sessions, { silent = true, desc = "Tmux workspace/session" })
