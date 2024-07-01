--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Config                              │
--  ╰──────────────────────────────────────────────────────────╯

-- lua/init.luajsdf
vim.g.lazyvim_json = vim.fn.stdpath("config") .. "/etc/lazyvim.json"
require("config/general")
require("config/lazy")
