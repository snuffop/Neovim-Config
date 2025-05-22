--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

----------------------------------------------------------------------

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

----------------------------------------------------------------------
--                           Quick Escape                           --
----------------------------------------------------------------------

vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("i", "kj", "<ESC>", { silent = true })

----------------------------------------------------------------------
--                           Quit Quickly                           --
----------------------------------------------------------------------

vim.keymap.set({ "n", "v", "i" }, "<M-q>", "<cmd>qa<cr>", { desc = "[P]Quit All" })


----------------------------------------------------------------------
--                   Snippet Jump in insert mode                    --
----------------------------------------------------------------------

vim.keymap.set({ "i", "s" }, "<C-j>", function()
    vim.snippet.jump(1)
end)
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    vim.snippet.jump(-1)
end)

----------------------------------------------------------------------
--                Start Peek for the current session                --
----------------------------------------------------------------------

vim.keymap.set("n", "<F3>", "<cmd>PeekOpen<cr>", { desc = "Peek Open" })

----------------------------------------------------------------------
--                               oil                                --
----------------------------------------------------------------------

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "OIL open parent" })

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

vim.api.nvim_set_keymap("n", "<M-k>", "<cmd>WhichKey<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-k>", "<cmd>WhichKey<space>v<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<cmd>WhichKey<space>i<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<M-k>", "<cmd>WhichKey<space>c<cr>", { noremap = true, silent = true })

-- movement
vim.keymap.set({ 'n', 'v' }, 'gk', '<cmd>Treewalker Up<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'gj', '<cmd>Treewalker Down<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'gh', '<cmd>Treewalker Left<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'gl', '<cmd>Treewalker Right<cr>', { silent = true })

-- swapping
vim.keymap.set('n', 'gK', '<cmd>Treewalker SwapUp<cr>', { silent = true })
vim.keymap.set('n', 'gJ', '<cmd>Treewalker SwapDown<cr>', { silent = true })
vim.keymap.set('n', 'gH', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
vim.keymap.set('n', 'gL', '<cmd>Treewalker SwapRight<cr>', { silent = true })
----------------------------------------------------------------------
--                          Comment Block                           --
----------------------------------------------------------------------

vim.api.nvim_set_keymap('n', 'gcb', ":lua require('nvim-comment-frame').add_comment()<CR>", { desc = "Comment Block Add", noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gcC', ":lua require('nvim-comment-frame').add_multiline_comment()<CR>", { desc = "Comment Multi Block", noremap = true, silent = true })

----------------------------------------------------------------------
--                    Which-Key Top level labels                    --
----------------------------------------------------------------------

local wk = require("which-key")
wk.add({
    { "<leader>A", group = "+Applications"},
    { "<leader>n", group = "+Notes"},
    { "<leader>R", group = "+Reload"},
    { "<leader>nb", group = "+Bridge"},
    { "<leader>nd", group = "+Daily"},
    { "<leader>no", group = "+Open"},
    { "<leader>m", group = "+My"},
    { "<leader>mt", group = "+NeoWarrior"},
})

local map = LazyVim.safe_keymap_set

--======================================================================
--                           Leader Maps                            --
--======================================================================

----------------------------------------------------------------------
--                               TAB                                --
----------------------------------------------------------------------

map("n", "<leader><tab><tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })

----------------------------------------------------------------------
--                          Tmux Navigate                           --
----------------------------------------------------------------------

map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Tmux Down" })
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>", { desc = "Tmux Last Active" })
map("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>", { desc = "Tmux Next" })

----------------------------------------------------------------------
--                      Applications                                --
----------------------------------------------------------------------

map("n", "<leader>Af", "<cmd>Feed<cr>", { desc = "RSS Feed" })

----------------------------------------------------------------------
--                              Buffer                              --
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         code insertions                          --
----------------------------------------------------------------------

map("n", "<leader>cj", "<cmd>lua require('jq').run()<cr>", { desc = "JQ Interface" })

----------------------------------------------------------------------
--                                D                                 --
----------------------------------------------------------------------

map("n", "<leader>dd", '"_d', { desc = 'Delete to the void register'})
map("n", "<leader>dj", "<CMD>Oil<CR>", { desc = "DIRED Jump binding alias to OIL" })

----------------------------------------------------------------------
--                               File                               --
----------------------------------------------------------------------

map("n", "<leader>fo", "<cmd>FuzzyOil<cr>", { desc = "Fuzzy Oil" })
map("n", "<leader>fs", "<cmd>up<cr>", { desc = "File Save" })
map("n", "<leader>fS", "<cmd>w !sudo tee %<CR>", { desc = "Sudo Write" })

----------------------------------------------------------------------
--                               GIT                                --
----------------------------------------------------------------------

map("n", "<leader>gT", "<cmd>Tardis<cr>", { desc = "Tardis (TimeMachine)" })
map("n", "<leader>gm", "<cmd>GitMessenger<cr>", { desc = "Git Messenger" })
map("n", "<leader>gg", function() require("lazygit-confirm").confirm() end, { desc = "Git Confirm" })


----------------------------------------------------------------------
--                         My
----------------------------------------------------------------------

map('n', '<leader>mm', function()
  vim.cmd('write')
  local input = vim.fn.expand('%:p')
  local output = vim.fn.expand('%:p:r') .. '.md'
  vim.cmd('!pandoc "' .. input .. '" -f org -t markdown -o "' .. output .. '"')
end, { desc = "Convert Org to Markdown with Pandoc" })


----------------------------------------------------------------------
--                              Notes                               --
----------------------------------------------------------------------
map("n", "<leader>nzoi", "<cmd>e ~/Zettelkasten/Inbox/inbox.md<cr>", { desc = "Open INBOX" })
map("n", "<leader>nzog", "<cmd>e ~/Zettelkasten/Inbox/tasks.md<cr>", { desc = "Open Tasks" })

map("n", "<leader>nzI", "<Cmd>ZkIndex<CR>", { desc = "ZK index" })
map("n", "<leader>nzN", "<Cmd>ZkNew { title = vim.kn.input('Title: ') }<CR>", { desc = "ZK New" })
map("n", "<leader>nzb", "<Cmd>ZkBacklinks<CR>", { desc = "ZK Backlinks" })
map("n", "<leader>nzc", "<Cmd>ZkCd<CR>", { desc = "ZK cd" })
map("n", "<leader>nzi", "<Cmd>ZkInsertLink<CR>", { desc = "ZK Insert Link" })
map("n", "<leader>nzl", "<Cmd>ZkLinks<CR>", { desc = "ZK Links" })
map("n", "<leader>nzr", "<Cmd>ZkNotes { createdAfter = '3 days ago' }<CR>", { desc = "ZK Recent" })
map("n", "<leader>nzt", "<Cmd>ZkTags<CR>", { desc = "ZK Tags" })
map("n", "<leader>nzz", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = "ZK Notes" })

-- Key map from copilot. son of a bitch. it worked.
vim.keymap.set("n", "<leader>nzj", function()
  local file = vim.fn.system("daily-file.sh")
  file = vim.fn.trim(file) -- Remove any trailing newline characters
  if vim.fn.filereadable(file) == 1 then
    vim.cmd("edit " .. file)
  else
    print("File not found: " .. file)
    require("zk.commands").get("ZkNew")({ dir = "journals" })
  end
end, { desc = "Open file from script" })

map("v", "<leader>nzf", "<Cmd>:'<,'>ZkMatch<CR>", { desc = "ZK Match" })
map("v", "<leader>nzi", "<Cmd>:'<,'>ZkInsertLinkAtSelection<CR>", { desc = "ZK Insert Link" })
map("v", "<leader>nzN", "<Cmd>'<,'>ZkNewFromTitleSelection<CR>", { desc = "ZK New" })

map("n", "<leader>nh", function() Snacks.picker.notifications() end, { desc = "Notification History" })

----------------------------------------------------------------------
--                         Search Telescope                         --
----------------------------------------------------------------------

map("n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "Search projects" })
map("n", "<leader>sf", "<cmd>Telescope filetypes<cr>", { desc = "Search Filetype" })
map("n", "<leader>sN", "<cmd>Telescope nerdy<cr>", { desc = "Search Nerdy" })

----------------------------------------------------------------------
--                                UI                                --
----------------------------------------------------------------------

map("n", "<leader>uM", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })
map("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notification" })

-- --  https://www.youtube.com/watch?v=EYczZLNEnIY
-- -------------------------------------------------------------------------------
-- --                           Folding section
-- -------------------------------------------------------------------------------
--
-- -- Checks each line to see if it matches a markdown heading (#, ##, etc.):
-- -- It’s called implicitly by Neovim’s folding engine by vim.opt_local.foldexpr
-- function _G.markdown_foldexpr()
--   local lnum = vim.v.lnum
--   local line = vim.fn.getline(lnum)
--   local heading = line:match("^(#+)%s")
--   if heading then
--     local level = #heading
--     if level == 1 then
--       -- Special handling for H1
--       if lnum == 1 then
--         return ">1"
--       else
--         local frontmatter_end = vim.b.frontmatter_end
--         if frontmatter_end and (lnum == frontmatter_end + 1) then
--           return ">1"
--         end
--       end
--     elseif level >= 2 and level <= 6 then
--       -- Regular handling for H2-H6
--       return ">" .. level
--     end
--   end
--   return "="
-- end
--
-- local function set_markdown_folding()
--   vim.opt_local.foldmethod = "expr"
--   vim.opt_local.foldexpr = "v:lua.markdown_foldexpr()"
--   vim.opt_local.foldlevel = 99
--
--   -- Detect frontmatter closing line
--   local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
--   local found_first = false
--   local frontmatter_end = nil
--   for i, line in ipairs(lines) do
--     if line == "---" then
--       if not found_first then
--         found_first = true
--       else
--         frontmatter_end = i
--         break
--       end
--     end
--   end
--   vim.b.frontmatter_end = frontmatter_end
-- end
--
-- -- Use autocommand to apply only to markdown files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = set_markdown_folding,
-- })
--
-- -- Function to fold all headings of a specific level
-- local function fold_headings_of_level(level)
--   -- Move to the top of the file without adding to jumplist
--   vim.cmd("keepjumps normal! gg")
--   -- Get the total number of lines
--   local total_lines = vim.fn.line("$")
--   for line = 1, total_lines do
--     -- Get the content of the current line
--     local line_content = vim.fn.getline(line)
--     -- "^" -> Ensures the match is at the start of the line
--     -- string.rep("#", level) -> Creates a string with 'level' number of "#" characters
--     -- "%s" -> Matches any whitespace character after the "#" characters
--     -- So this will match `## `, `### `, `#### ` for example, which are markdown headings
--     if line_content:match("^" .. string.rep("#", level) .. "%s") then
--       -- Move the cursor to the current line without adding to jumplist
--       vim.cmd(string.format("keepjumps call cursor(%d, 1)", line))
--       -- Check if the current line has a fold level > 0
--       local current_foldlevel = vim.fn.foldlevel(line)
--       if current_foldlevel > 0 then
--         -- Fold the heading if it matches the level
--         if vim.fn.foldclosed(line) == -1 then
--           vim.cmd("normal! za")
--         end
--         -- else
--         --   vim.notify("No fold at line " .. line, vim.log.levels.WARN)
--       end
--     end
--   end
-- end
--
-- local function fold_markdown_headings(levels)
--   -- I save the view to know where to jump back after folding
--   local saved_view = vim.fn.winsaveview()
--   for _, level in ipairs(levels) do
--     fold_headings_of_level(level)
--   end
--   vim.cmd("nohlsearch")
--   -- Restore the view to jump to where I was
--   vim.fn.winrestview(saved_view)
-- end
--
-- -- HACK: Fold markdown headings in Neovim with a keymap
-- -- https://youtu.be/EYczZLNEnIY
-- --
-- -- Keymap for folding markdown headings of level 1 or above
-- vim.keymap.set("n", "zj", function()
--   -- "Update" saves only if the buffer has been modified since the last save
--   vim.cmd("silent update")
--   -- vim.keymap.set("n", "<leader>mfj", function()
--   -- Reloads the file to refresh folds, otheriise you have to re-open neovim
--   vim.cmd("edit!")
--   -- Unfold everything first or I had issues
--   vim.cmd("normal! zR")
--   fold_markdown_headings({ 6, 5, 4, 3, 2, 1 })
--   vim.cmd("normal! zz") -- center the cursor line on screen
-- end, { desc = "[P]Fold all headings level 1 or above" })
--
-- -- HACK: Fold markdown headings in Neovim with a keymap
-- -- https://youtu.be/EYczZLNEnIY
-- --
-- -- Keymap for folding markdown headings of level 2 or above
-- -- I know, it reads like "madafaka" but "k" for me means "2"
-- vim.keymap.set("n", "zk", function()
--   -- "Update" saves only if the buffer has been modified since the last save
--   vim.cmd("silent update")
--   -- vim.keymap.set("n", "<leader>mfk", function()
--   -- Reloads the file to refresh folds, otherwise you have to re-open neovim
--   vim.cmd("edit!")
--   -- Unfold everything first or I had issues
--   vim.cmd("normal! zR")
--   fold_markdown_headings({ 6, 5, 4, 3, 2 })
--   vim.cmd("normal! zz") -- center the cursor line on screen
-- end, { desc = "[P]Fold all headings level 2 or above" })
--
-- -- HACK: Fold markdown headings in Neovim with a keymap
-- -- https://youtu.be/EYczZLNEnIY
-- --
-- -- Keymap for folding markdown headings of level 3 or above
-- vim.keymap.set("n", "zl", function()
--   -- "Update" saves only if the buffer has been modified since the last save
--   vim.cmd("silent update")
--   -- vim.keymap.set("n", "<leader>mfl", function()
--   -- Reloads the file to refresh folds, otherwise you have to re-open neovim
--   vim.cmd("edit!")
--   -- Unfold everything first or I had issues
--   vim.cmd("normal! zR")
--   fold_markdown_headings({ 6, 5, 4, 3 })
--   vim.cmd("normal! zz") -- center the cursor line on screen
-- end, { desc = "[P]Fold all headings level 3 or above" })
--
-- -- HACK: Fold markdown headings in Neovim with a keymap
-- -- https://youtu.be/EYczZLNEnIY
-- --
-- -- Keymap for folding markdown headings of level 4 or above
-- vim.keymap.set("n", "z;", function()
--   -- "Update" saves only if the buffer has been modified since the last save
--   vim.cmd("silent update")
--   -- vim.keymap.set("n", "<leader>mf;", function()
--   -- Reloads the file to refresh folds, otherwise you have to re-open neovim
--   vim.cmd("edit!")
--   -- Unfold everything first or I had issues
--   vim.cmd("normal! zR")
--   fold_markdown_headings({ 6, 5, 4 })
--   vim.cmd("normal! zz") -- center the cursor line on screen
-- end, { desc = "[P]Fold all headings level 4 or above" })
--
-- -- HACK: Fold markdown headings in Neovim with a keymap
-- -- https://youtu.be/EYczZLNEnIY
-- --
-- -- Use <CR> to fold when in normal mode
-- -- To see help about folds use `:help fold`
-- vim.keymap.set("n", "<CR>", function()
--   -- Get the current line number
--   local line = vim.fn.line(".")
--   -- Get the fold level of the current line
--   local foldlevel = vim.fn.foldlevel(line)
--   if foldlevel == 0 then
--     vim.notify("No fold found", vim.log.levels.INFO)
--   else
--     vim.cmd("normal! za")
--     vim.cmd("normal! zz") -- center the cursor line on screen
--   end
-- end, { desc = "[P]Toggle fold" })
--
-- -- HACK: Fold markdown headings in Neovim with a keymap
-- -- https://youtu.be/EYczZLNEnIY
-- --
-- -- Keymap for unfolding markdown headings of level 2 or above
-- -- Changed all the markdown folding and unfolding keymaps from <leader>mfj to
-- -- zj, zk, zl, z; and zu respectively lamw25wmal
-- vim.keymap.set("n", "zu", function()
--   -- "Update" saves only if the buffer has been modified since the last save
--   vim.cmd("silent update")
--   -- vim.keymap.set("n", "<leader>mfu", function()
--   -- Reloads the file to reflect the changes
--   vim.cmd("edit!")
--   vim.cmd("normal! zR") -- Unfold all headings
--   vim.cmd("normal! zz") -- center the cursor line on screen
-- end, { desc = "[P]Unfold all headings level 2 or above" })
--
-- -- HACK: Fold markdown headings in Neovim with a keymap
-- -- https://youtu.be/EYczZLNEnIY
-- --
-- -- gk jummps to the markdown heading above and then folds it
-- -- zi by default toggles folding, but I don't need it lamw25wmal
-- vim.keymap.set("n", "zi", function()
--   -- "Update" saves only if the buffer has been modified since the last save
--   vim.cmd("silent update")
--   -- Difference between normal and normal!
--   -- - `normal` executes the command and respects any mappings that might be defined.
--   -- - `normal!` executes the command in a "raw" mode, ignoring any mappings.
--   vim.cmd("normal gk")
--   -- This is to fold the line under the cursor
--   vim.cmd("normal! za")
--   vim.cmd("normal! zz") -- center the cursor line on screen
-- end, { desc = "[P]Fold the heading cursor currently on" })
--
-- -------------------------------------------------------------------------------
-- --                         End Folding section
-- -------------------------------------------------------------------------------
-- EOF



