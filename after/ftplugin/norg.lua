--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- Norg only keymaps

vim.cmd([[
  inoremap  <C-i> <cmd>Telescope neorg insert_link<cr>
  inoremap  <C-l> <cmd>Telescope neorg insert_file_link<cr>
  inoremap  <C-s> <cmd>Telescope neorg find_linkable<cr>
]])

local wk = require("which-key")
wk.add({
    { "<localleader>c", group = "Neorg CodeBlock"},
    { "<localleader>i", group = "Neorg Insert"},
    { "<localleader>j", group = "Neorg Journal"},
    { "<localleader>l", group = "Neorg Lists"},
    { "<localleader>n", group = "Neorg Note"},
    { "<localleader>t", group = "Neorg Task"},
    { "<localleader>s", group = "Neorg Search"},
    { "<localleader>x", group = "Neorg Xtra"},
})


vim.keymap.set("n", "<localleader>I", "<cmd>Neorg index<cr>", { desc = "neorg index" })
vim.keymap.set("n", "<localleader>r", "<cmd>Neorg return<cr>", { desc = "neorg return" })

vim.keymap.set("n", "<localleader>il", "<cmd>Telescope neorg insert_file_link<cr>", { desc = "Insert file link" })

vim.keymap.set("n", "<localleader>nf", "<cmd>Telescope neorg find_norg_files<cr>", { desc = "Find files " })

vim.keymap.set("n", "<localleader>T", "<cmd>Neorg toc qflist<cr>", { desc = "TOC Quick list" })
-- Search
vim.keymap.set("n", "<localleader>sI", "<cmd>Telescope neorg insert_link<cr>", { desc = "Insert link" })
vim.keymap.set("n", "<localleader>sb", "<cmd>Telescope neorg find_backlinks<cr>", { desc = "Find backlinks " })
vim.keymap.set("n", "<localleader>sf", "<cmd>Telescope neorg find_linkable<cr>", { desc = "Find linkable" })
vim.keymap.set("n", "<localleader>sh", "<cmd>Telescope neorg search_headings<cr>", { desc = "Search headings " })
vim.keymap.set("n", "<localleader>si", "<cmd>Telescope neorg insert_file_link<cr>", { desc = "Insert file link" })
vim.keymap.set("n", "<localleader>ss", "<cmd>Telescope neorg search_headings<cr>", { desc = "Search headings" })
vim.keymap.set("n", "<localleader>st", "<cmd>Neorg search query fulltext<cr>", { desc = "Search fulltext" })
vim.keymap.set("n", "<localleader>sc", "<cmd>Neorg search query categories<cr>", { desc = "Search categories" })
vim.keymap.set("n", "<localleader>sS", "<cmd>Neorg search index<cr>", { desc = "Search Index" })

-- Journal
vim.keymap.set("n", "<localleader>jT", "<cmd>Neorg journal toc<cr>", { desc = "TOC" })
vim.keymap.set("n", "<localleader>jc", "<cmd>Neorg journal custom<cr>", { desc = "custom" })
vim.keymap.set("n", "<localleader>jj", "<cmd>Neorg journal today<cr>", { desc = "today" })
vim.keymap.set("n", "<localleader>jm", "<cmd>Neorg templates load journal<cr>", { desc = "Apply journal template" })
vim.keymap.set("n", "<localleader>jt", "<cmd>Neorg journal tomorrow<cr>", { desc = "tomorrow" })
vim.keymap.set("n", "<localleader>jy", "<cmd>Neorg journal yesterday<cr>", { desc = "yesterday" })

vim.keymap.set("n", "<localleader>xi", "<cmd>Neorg inject-metadata<cr>", { desc = "inject metadata" })
vim.keymap.set("n", "<localleader>xs", "<cmd>Neorg generate-workspace-summary<cr>", { desc = "Generate summary" })
vim.keymap.set("n", "<localleader>xu", "<cmd>Neorg update-metadata<cr>", { desc = "update metadata" })


vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end

        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- ... your other lsp mappings
    end
})

-- Snippets

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

ls.add_snippets("lua", {
  snip("hello", {
    text('print("Hello '),
    ins(1),
    text(' world")'),
  }),
})


-- NEORG
ls.add_snippets("norg", {
  snip(
    "jira",
    fmt(
      [[
      {{https://jira-joyent.atlassian.net/browse/{}}}[{}]
    ]],
      {
        ins(1),
        rep(1),
      }
    )
  ),
})

ls.add_snippets("norg", {
  snip(
    "sysops",
    fmt(
      [[
      {{https://jira-joyent.atlassian.net/browse/SYSOPS-{}}}[SYSOPS-{}]
    ]],
      {
        ins(1),
        rep(1),
      }
    )
  ),
})


