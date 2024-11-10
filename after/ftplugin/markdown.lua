--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- snippets

local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local ins = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

vim.keymap.set({ "i", "s" }, "<A-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-h>", function()
  if ls.expand_or_jumpable(-1) then
    ls.expand_or_jump(-1)
  end
end, { silent = true })

ls.add_snippets("markdown", {
  snip(
    "JIRA",
    fmt(
      [[
      [JIRA:{}](https://jira-joyent.atlassian.net/browse/{})
    ]],
      {
        ins(1),
        rep(1),
      }
    )
  ),
})
end
