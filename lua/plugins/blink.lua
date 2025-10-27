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

    -- merge provider score tweaks without clobbering anything else
    opts.sources.providers = vim.tbl_deep_extend("force", opts.sources.providers or {}, {
      lsp = { score_offset = 30 },
      path = { score_offset = 20 },
      snippets = { score_offset = 90 },  -- make snippets win
      buffer = { score_offset = 10 },
      -- UNCOMMENT ONLY IF you have a Copilot source installed:
      -- For fang2hou/blink-copilot:
      copilot = { module = "blink-copilot", name = "copilot", async = true, score_offset = 5 },
      -- For giuxtaposition/blink-cmp-copilot via compat:
      -- copilot = { module = "blink.compat.source", name = "copilot", score_offset = 5 },
    })
  end,
}
