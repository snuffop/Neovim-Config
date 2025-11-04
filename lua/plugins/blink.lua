--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

-- Options to override tab instead of return for accept suggestion

return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.sources = opts.sources or {}

    -- keep your defaults
    opts.sources.default = { "lsp", "path", "snippets", "buffer" }

    -- Merge provider score tweaks without clobbering anything else
    opts.sources.providers = vim.tbl_deep_extend("force", opts.sources.providers or {}, {
      lsp = { score_offset = 30 },
      path = { score_offset = 20 },
      snippets = { score_offset = 90 },  -- make snippets win
      buffer = { score_offset = 10 },
      copilot = { module = "blink-copilot", name = "copilot", async = true, score_offset = 5 },
    })

    -- ✅ Use <Tab> to accept completion, and disable <CR>
    opts.keymap = vim.tbl_deep_extend("force", opts.keymap or {}, {
      preset = nil,                          -- No preset; we’re defining keys explicitly
      ["<Tab>"]   = { "accept", "fallback" },-- Confirm selected item
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<CR>"]    = {},
      -- Optional: keep comfy navigation
      ["<C-n>"]   = { "select_next", "fallback" },
      ["<C-p>"]   = { "select_prev", "fallback" },
    })
  end,
}
