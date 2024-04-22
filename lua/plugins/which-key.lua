return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gs"] = { name = "+surround" },
      ["z"] = { name = "+fold" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>fm"] = { name = "+Managers" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>gb"] = { name = "+blame" },
      ["<leader>gh"] = { name = "+hunks" },
      ["<leader>n"] = { name = "+Neorg" },
      ["<leader>nm"] = { name = "Module" },
      ["<leader>nt"] = { name = "Telescope" },
      ["<leader>nj"] = { name = "Journal" },
      ["<leader>nx"] = { name = "Tool" },
      ["<leader>nw"] = { name = "Workspace" },
      ["<leader>o"] = { name = "+Obsidian" },
      ["<leader>p"] = { name = "+Projects" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>t"] = { name = "+Text/Toggle" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
    if LazyVim.has("noice.nvim") then
      opts.defaults["<leader>sn"] = { name = "+noice" }
    end
  end,
}
