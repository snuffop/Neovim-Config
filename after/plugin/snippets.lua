-- snippets

local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local ins = ls.insert_node

vim.keymap.set({ "i", "s" }, "<A-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
  if ls.expand_or_jumpable(-1) then
    ls.expand_or_jump(-1)
  end
end, { silent = true })

ls.add_snippets("lua", {
  snip("hello", {
    text('print("Hello '),
    ins(1),
    text(' world")'),
  }),
})
