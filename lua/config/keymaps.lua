--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

----------------------------------------------------------------------
--                       Visual Mode Movement                        --
----------------------------------------------------------------------

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

----------------------------------------------------------------------
--                           Quick Escape                           --
----------------------------------------------------------------------

local escape_keys = { "jj", "jk", "kj" }
for _, key in ipairs(escape_keys) do
    vim.keymap.set("i", key, "<ESC>", { silent = true })
end

----------------------------------------------------------------------
--                           Quit Quickly                           --
----------------------------------------------------------------------

vim.keymap.set({ "n", "v", "i" }, "<M-q>", "<cmd>qa<cr>", { desc = "[P]Quit All" })

----------------------------------------------------------------------
--                   Snippet Jump in insert mode                    --
----------------------------------------------------------------------

vim.keymap.set({ "i", "s" }, "<C-k>", function()
    require("luasnip").expand_or_jump()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function()
    require("luasnip").jump(-1)
end, { silent = true })

----------------------------------------------------------------------
--                Start Peek for the current session                --
----------------------------------------------------------------------

vim.keymap.set("n", "<F3>", "<cmd>PeekOpen<cr>", { desc = "Peek Open" })

----------------------------------------------------------------------
--                          reload keymaps                          --
----------------------------------------------------------------------

vim.keymap.set(
    "n",
    "<leader>Rk",
    "<cmd>source ~/.config/nvim/lua/config/keymaps.lua<cr>",
    { desc = "Reload keymaps.lua" }
)

----------------------------------------------------------------------
--                         reload snippets                          --
----------------------------------------------------------------------

vim.keymap.set(
    "n",
    "<leader>Rs",
    "<cmd>source ~/.config/nvim/after/plugin/snippets.lua<cr>",
    { desc = "Reload luasnip.lua" }
)

----------------------------------------------------------------------
--            Which-key  Alt-K top level keymaps display            --
----------------------------------------------------------------------

local whichkey_modes = {
    { "n", "<cmd>WhichKey<cr>" },
    { "v", "<cmd>WhichKey<space>v<cr>" },
    { "i", "<cmd>WhichKey<space>i<cr>" },
    { "c", "<cmd>WhichKey<space>c<cr>" },
}
for _, mode_config in ipairs(whichkey_modes) do
    vim.keymap.set(mode_config[1], "<M-k>", mode_config[2], { silent = true })
end

----------------------------------------------------------------------
--                           Treewalker                             --
----------------------------------------------------------------------

local treewalker_movements = {
    { "gk", "Up" },
    { "gj", "Down" },
    { "gh", "Left" },
    { "gl", "Right" },
}
for _, movement in ipairs(treewalker_movements) do
    vim.keymap.set({ "n", "v" }, movement[1], "<cmd>Treewalker " .. movement[2] .. "<cr>", { silent = true })
    vim.keymap.set("n", string.upper(movement[1]:sub(2)), "<cmd>Treewalker Swap" .. movement[2] .. "<cr>", { silent = true })
end

----------------------------------------------------------------------
--                          Comment Block                           --
----------------------------------------------------------------------

vim.keymap.set("n", "gcb", ":lua require('nvim-comment-frame').add_comment()<CR>", { desc = "Comment Block Add", silent = true })
vim.keymap.set("n", "gcC", ":lua require('nvim-comment-frame').add_multiline_comment()<CR>", { desc = "Comment Multi Block", silent = true })

----------------------------------------------------------------------
--                    Which-Key Top level labels                    --
----------------------------------------------------------------------

local wk = require("which-key")
wk.add({
    { "<leader>R", group = "+Reload" },
    { "<leader>T", group = "+Checkmate" },
    { "<leader>p", group = "+Projects" },
    { "<leader>z", group = "+ZK" },
    { "<leader>zn", group = "+ZK New" },
    { "<leader>z<space>", group = "+ZK Dailies" },
})

local map = LazyVim.safe_keymap_set

----------------------------------------------------------------------
--                               TAB                                --
----------------------------------------------------------------------

map("n", "<leader><tab><tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })

----------------------------------------------------------------------
--                         code insertions                          --
----------------------------------------------------------------------

map("n", "<leader>cj", "<cmd>lua require('jq').run()<cr>", { desc = "JQ Interface" })

----------------------------------------------------------------------
--                                D                                 --
----------------------------------------------------------------------

map("n", "<leader>dd", '"_d', { desc = "Delete to the void register" })

----------------------------------------------------------------------
--                               File                               --
----------------------------------------------------------------------

map("n", "<leader>fs", "<cmd>up<cr>", { desc = "File Save" })
map("n", "<leader>fS", "<cmd>w !sudo tee %<CR>", { desc = "Sudo Write" })

-- Copy Path
vim.keymap.set("n", "<leader>fC", function()
    local path = vim.api.nvim_buf_get_name(0)
    vim.fn.setreg("+", path) -- copy to system clipboard
    print("Copied: " .. path)
end, { desc = "Copy file path" })

----------------------------------------------------------------------
--                               GIT                                --
----------------------------------------------------------------------

map("n", "<leader>gT", "<cmd>Tardis<cr>", { desc = "Tardis (TimeMachine)" })
map("n", "<leader>gm", "<cmd>GitMessenger<cr>", { desc = "Git Messenger" })
map("n", "<leader>gz", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
map("n", "<leader>gv", function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen")
    else
        vim.cmd("DiffviewClose")
    end
end, { desc = "Git DiffView" })
map("n", "<leader>gg", function()
    require("lazygit-confirm").confirm()
end, { noremap = true, desc = "LazyGit /w confirm" })

----------------------------------------------------------------------
--                          Miscellaneous                           --
----------------------------------------------------------------------

map("n", "<leader>mm", function()
    vim.cmd("write")
    local input = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:p:r") .. ".md"
    vim.cmd('!pandoc "' .. input .. '" -f org -t markdown -o "' .. output .. '"')
end, { desc = "Convert Org to Markdown" })

----------------------------------------------------------------------
--                                UI                                --
----------------------------------------------------------------------

map("n", "<leader>un", function()
    Snacks.notifier.hide()
end, { desc = "Dismiss All Notification" })
map("n", "<leader>uB", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame" })
map("n", "<leader>uR", function()
    local is_running = false
    for _, client in ipairs(vim.lsp.get_clients()) do
        if client.name == "marksman" then
            is_running = true
            break
        end
    end
    if is_running then
        vim.cmd("LspRestart marksman")
        vim.notify("Marksman LSP restarted", vim.log.levels.INFO)
    else
        vim.cmd("LspStart marksman")
        vim.notify("Marksman LSP started", vim.log.levels.INFO)
    end
end, { desc = "Start/Restart Marksman LSP" })

----------------------------------------------------------------------
--                      Markdown Navigation                         --
----------------------------------------------------------------------

local query = vim.treesitter.query.parse("markdown", "((atx_heading) @header)")
map("n", "]h", function()
    local root = vim.treesitter.get_parser():parse()[1]:root()
    local _, node, _ = query:iter_captures(root, 0, vim.fn.line("."), -1)()
    if node then
        require("nvim-treesitter.ts_utils").goto_node(node)
    end
end, { desc = "Next Markdown Heading" })

-- EOF
