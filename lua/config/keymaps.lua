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

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

----------------------------------------------------------------------
--                          reload keymaps                          --
----------------------------------------------------------------------

vim.keymap.set(
    "n",
    "<leader><leader>k",
    "<cmd>source ~/.config/nvim/lua/config/keymaps.lua<cr>",
    { desc = "Reload keymaps.lua" }
)

----------------------------------------------------------------------
--                         reload snippets                          --
----------------------------------------------------------------------

vim.keymap.set(
    "n",
    "<leader><leader>s",
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
    { "<leader>n", group = "+Notes"},
    { "<leader>nb", group = "+Bridge"},
    { "<leader>nd", group = "+Daily"},
    { "<leader>no", group = "+Open"},
    { "<leader>m", group = "+Markdown"},
    { "<leader>mh", group = "+Headers"},
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
--                              Buffer                              --
----------------------------------------------------------------------

map("n", "<leader>bB", "<cmd>Telescope buffers<cr>", { desc = "Telescope Buffers" })

----------------------------------------------------------------------
--                         code insertions                          --
----------------------------------------------------------------------

map("n", "<leader>cj", "<cmd>lua require('jq').run()<cr>", { desc = "JQ Interface" })

----------------------------------------------------------------------
--                                D                                 --
----------------------------------------------------------------------

map("n", "<leader>dd", '"_d', { desc = 'Delete to the void register'})

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
--                              Notes                               --
----------------------------------------------------------------------

map("n", "<leader>nL",  "<cmd>ObsidianLinkNew<cr>", { desc = "Link New" })
map("n", "<leader>nN",  "<cmd>ObsidianNew<cr>", { desc = "New Note" })
map("n", "<leader>nT",  "<cmd>ObsidianTemplate<cr>", { desc = "Add Template" })
map("n", "<leader>nbb", "<cmd>ObsidianBacklinks<cr>", { desc = "Find Backlinks" })
map("n", "<leader>nbt", "<cmd>ObsidianBridgeTelescopeCommand<cr>", { desc = "Bridge Telescope" })
map("n", "<leader>nbv", "<cmd>ObsidianBridgeOpenGraph<cr>", { desc = "Bridge Open Graph" })
map("n", "<leader>nbv", "<cmd>ObsidianBridgeOpenVaultMenu<cr>", { desc = "Bridge Vault Menu" })
map("n", "<leader>ndd", "<cmd>ObsidianDailies -30 2<cr>", { desc = "Open Dailies" })
map("n", "<leader>ndt", "<cmd>ObsidianToday<cr>", { desc = "Open Today" })
map("n", "<leader>ndw", "<cmd>ObsidianTomorrow<cr>", { desc = "Open Tomorrow" })
map("n", "<leader>ndy", "<cmd>ObsidianYesterday<cr>", { desc = "Open Yesterday" })
map("n", "<leader>nf",  "<cmd>ObsidianFollowLink<cr>", { desc = "Follow Link" })
map("n", "<leader>ng",  "<cmd>ObsidianTags<cr>", { desc = "Tags" })
map("n", "<leader>nl",  "<cmd>ObsidianLinks<cr>", { desc = "List Links" })
map("n", "<leader>nn",  "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick Switch" })
map("n", "<leader>noo", "<cmd>ObsidianOpen<cr>", { desc = "Open" })
map("n", "<leader>noi", "<cmd>e ~/Obsidian/default/0-Inbox/INBOX.md<cr>", { desc = "Open INBOX" })
map("n", "<leader>nog", "<cmd>e ~/Obsidian/default/0-Inbox/Tasks.md<cr>", { desc = "Open Tasks" })
map("n", "<leader>nr",  "<cmd>ObsidianRename<cr>", { desc = "Rename" })
map("n", "<leader>ns",  "<cmd>ObsidianSearch<cr>", { desc = "Search" })
map("n", "<leader>nt",  "<cmd>ObsidianToggleCheckbox<cr>", { desc = "Toggle Checkbox" })
map("n", "<leader>nx",  "<cmd>ObsidianExtractNote<cr>", { desc = "Extract Note" })

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


----------------------------------------------------------------------
--                                Function in keymap                --
----------------------------------------------------------------------

-- HACK: Jump between markdown headings in lazyvim
-- https://youtu.be/9S7Zli9hzTE
--
-- Search UP for a markdown header
-- Make sure to follow proper markdown convention, and you have a single H1
-- heading at the very top of the file
-- This will only search for H2 headings and above
vim.keymap.set({ "n", "v" }, "gk", function()
  -- `?` - Start a search backwards from the current cursor position.
  -- `^` - Match the beginning of a line.
  -- `##` - Match 2 ## symbols
  -- `\\+` - Match one or more occurrences of prev element (#)
  -- `\\s` - Match exactly one whitespace character following the hashes
  -- `.*` - Match any characters (except newline) following the space
  -- `$` - Match extends to end of line
  vim.cmd("silent! ?^##\\+\\s.*$")
  -- Clear the search highlight
  vim.cmd("nohlsearch")
end, { desc = "[P]Go to previous markdown header" })

-- HACK: Jump between markdown headings in lazyvim
-- https://youtu.be/9S7Zli9hzTE
--
-- Search DOWN for a markdown header
-- Make sure to follow proper markdown convention, and you have a single H1
-- heading at the very top of the file
-- This will only search for H2 headings and above
vim.keymap.set({ "n", "v" }, "gj", function()
  -- `/` - Start a search forwards from the current cursor position.
  -- `^` - Match the beginning of a line.
  -- `##` - Match 2 ## symbols
  -- `\\+` - Match one or more occurrences of prev element (#)
  -- `\\s` - Match exactly one whitespace character following the hashes
  -- `.*` - Match any characters (except newline) following the space
  -- `$` - Match extends to end of line
  vim.cmd("silent! /^##\\+\\s.*$")
  -- Clear the search highlight
  vim.cmd("nohlsearch")
end, { desc = "[P]Go to next markdown header" })


-------------------------------------------------------------------------------
--                           Folding section
-------------------------------------------------------------------------------

-- Checks each line to see if it matches a markdown heading (#, ##, etc.):
-- It’s called implicitly by Neovim’s folding engine by vim.opt_local.foldexpr
function _G.markdown_foldexpr()
  local lnum = vim.v.lnum
  local line = vim.fn.getline(lnum)
  local heading = line:match("^(#+)%s")
  if heading then
    local level = #heading
    if level == 1 then
      -- Special handling for H1
      if lnum == 1 then
        return ">1"
      else
        local frontmatter_end = vim.b.frontmatter_end
        if frontmatter_end and (lnum == frontmatter_end + 1) then
          return ">1"
        end
      end
    elseif level >= 2 and level <= 6 then
      -- Regular handling for H2-H6
      return ">" .. level
    end
  end
  return "="
end

local function set_markdown_folding()
  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = "v:lua.markdown_foldexpr()"
  vim.opt_local.foldlevel = 99

  -- Detect frontmatter closing line
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local found_first = false
  local frontmatter_end = nil
  for i, line in ipairs(lines) do
    if line == "---" then
      if not found_first then
        found_first = true
      else
        frontmatter_end = i
        break
      end
    end
  end
  vim.b.frontmatter_end = frontmatter_end
end

-- Use autocommand to apply only to markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = set_markdown_folding,
})

-- Function to fold all headings of a specific level
local function fold_headings_of_level(level)
  -- Move to the top of the file
  vim.cmd("normal! gg")
  -- Get the total number of lines
  local total_lines = vim.fn.line("$")
  for line = 1, total_lines do
    -- Get the content of the current line
    local line_content = vim.fn.getline(line)
    -- "^" -> Ensures the match is at the start of the line
    -- string.rep("#", level) -> Creates a string with 'level' number of "#" characters
    -- "%s" -> Matches any whitespace character after the "#" characters
    -- So this will match `## `, `### `, `#### ` for example, which are markdown headings
    if line_content:match("^" .. string.rep("#", level) .. "%s") then
      -- Move the cursor to the current line
      vim.fn.cursor(line, 1)
      -- Check if the current line has a fold level > 0
      local current_foldlevel = vim.fn.foldlevel(line)
      if current_foldlevel > 0 then
        -- Fold the heading if it matches the level
        if vim.fn.foldclosed(line) == -1 then
          vim.cmd("normal! za")
        end
        -- else
        --   vim.notify("No fold at line " .. line, vim.log.levels.WARN)
      end
    end
  end
end

local function fold_markdown_headings(levels)
  -- I save the view to know where to jump back after folding
  local saved_view = vim.fn.winsaveview()
  for _, level in ipairs(levels) do
    fold_headings_of_level(level)
  end
  vim.cmd("nohlsearch")
  -- Restore the view to jump to where I was
  vim.fn.winrestview(saved_view)
end

-- HACK: Fold markdown headings in Neovim with a keymap
-- https://youtu.be/EYczZLNEnIY
--
-- Keymap for folding markdown headings of level 1 or above
vim.keymap.set("n", "zj", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfj", function()
  -- Reloads the file to refresh folds, otheriise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_markdown_headings({ 6, 5, 4, 3, 2, 1 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "[P]Fold all headings level 1 or above" })

-- HACK: Fold markdown headings in Neovim with a keymap
-- https://youtu.be/EYczZLNEnIY
--
-- Keymap for folding markdown headings of level 2 or above
-- I know, it reads like "madafaka" but "k" for me means "2"
vim.keymap.set("n", "zk", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfk", function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_markdown_headings({ 6, 5, 4, 3, 2 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "[P]Fold all headings level 2 or above" })

-- HACK: Fold markdown headings in Neovim with a keymap
-- https://youtu.be/EYczZLNEnIY
--
-- Keymap for folding markdown headings of level 3 or above
vim.keymap.set("n", "zl", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfl", function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_markdown_headings({ 6, 5, 4, 3 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "[P]Fold all headings level 3 or above" })

-- HACK: Fold markdown headings in Neovim with a keymap
-- https://youtu.be/EYczZLNEnIY
--
-- Keymap for folding markdown headings of level 4 or above
vim.keymap.set("n", "z;", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mf;", function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_markdown_headings({ 6, 5, 4 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "[P]Fold all headings level 4 or above" })

-- HACK: Fold markdown headings in Neovim with a keymap
-- https://youtu.be/EYczZLNEnIY
--
-- Use <CR> to fold when in normal mode
-- To see help about folds use `:help fold`
vim.keymap.set("n", "<CR>", function()
  -- Get the current line number
  local line = vim.fn.line(".")
  -- Get the fold level of the current line
  local foldlevel = vim.fn.foldlevel(line)
  if foldlevel == 0 then
    vim.notify("No fold found", vim.log.levels.INFO)
  else
    vim.cmd("normal! za")
    vim.cmd("normal! zz") -- center the cursor line on screen
  end
end, { desc = "[P]Toggle fold" })

-- HACK: Fold markdown headings in Neovim with a keymap
-- https://youtu.be/EYczZLNEnIY
--
-- Keymap for unfolding markdown headings of level 2 or above
-- Changed all the markdown folding and unfolding keymaps from <leader>mfj to
-- zj, zk, zl, z; and zu respectively lamw25wmal
vim.keymap.set("n", "zu", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfu", function()
  -- Reloads the file to reflect the changes
  vim.cmd("edit!")
  vim.cmd("normal! zR") -- Unfold all headings
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "[P]Unfold all headings level 2 or above" })

-- HACK: Fold markdown headings in Neovim with a keymap
-- https://youtu.be/EYczZLNEnIY
--
-- gk jummps to the markdown heading above and then folds it
-- zi by default toggles folding, but I don't need it lamw25wmal
vim.keymap.set("n", "zi", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- Difference between normal and normal!
  -- - `normal` executes the command and respects any mappings that might be defined.
  -- - `normal!` executes the command in a "raw" mode, ignoring any mappings.
  vim.cmd("normal gk")
  -- This is to fold the line under the cursor
  vim.cmd("normal! za")
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "[P]Fold the heading cursor currently on" })

-------------------------------------------------------------------------------
--                         End Folding section
-------------------------------------------------------------------------------


-- - I have several `.md` documents that do not follow markdown guidelines
-- - There are some old ones that have more than one H1 heading in them, so when I
--   open one of those old documents, I want to add one more `#` to each heading
--
--  This doesn't ask for confirmation and just increase all the headings
vim.keymap.set("n", "<leader>mhI", function()
  -- Save the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  -- I'm using [[ ]] to escape the special characters in a command
  vim.cmd([[:g/\(^$\n\s*#\+\s.*\n^$\)/ .+1 s/^#\+\s/#&/]])
  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)
  -- Clear search highlight
  vim.cmd("nohlsearch")
end, { desc = "[P]Increase headings without confirmation" })

vim.keymap.set("n", "<leader>mhD", function()
  -- Save the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  -- I'm using [[ ]] to escape the special characters in a command
  vim.cmd([[:g/^\s*#\{2,}\s/ s/^#\(#\+\s.*\)/\1/]])
  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)
  -- Clear search highlight
  vim.cmd("nohlsearch")
end, { desc = "[P]Decrease headings without confirmation" })

-- Increase markdown headings for text selected in visual mode
vim.keymap.set("v", "<leader>mhI", function()
  -- Save cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  -- Get visual selection bounds and ensure correct order
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local buf = vim.api.nvim_get_current_buf()
  -- Process each line in the selection
  for lnum = start_line, end_line do
    local line = vim.api.nvim_buf_get_lines(buf, lnum - 1, lnum, false)[1]
    if line and line:match("^##+%s") then -- Match headings level 2+
      local new_line = "#" .. line
      vim.api.nvim_buf_set_lines(buf, lnum - 1, lnum, false, { new_line })
    end
  end
  -- Restore cursor and clear highlights
  vim.api.nvim_win_set_cursor(0, cursor_pos)
  vim.cmd("nohlsearch")
end, { desc = "Increase headings in visual selection" })

-- Decrease markdown headings for text selected in visual mode
vim.keymap.set("v", "<leader>mhD", function()
  -- Save cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  -- Get visual selection bounds and ensure correct order
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local buf = vim.api.nvim_get_current_buf()
  -- Process each line in the selection
  for lnum = start_line, end_line do
    local line = vim.api.nvim_buf_get_lines(buf, lnum - 1, lnum, false)[1]
    if line and line:match("^##+%s") then -- Match headings level 2+
      -- Split into hashes and content, then remove one #
      local hashes, content = line:match("^(#+)(%s.+)$")
      if hashes and #hashes >= 2 then
        local new_hashes = hashes:sub(1, #hashes - 1)
        local new_line = new_hashes .. content
        vim.api.nvim_buf_set_lines(buf, lnum - 1, lnum, false, { new_line })
      end
    end
  end
  -- Restore cursor and clear highlights
  vim.api.nvim_win_set_cursor(0, cursor_pos)
  vim.cmd("nohlsearch")
end, { desc = "Decrease headings in visual selection" })

-- -- This goes 1 heading at a time and asks for **confirmation**
-- -- - keep pressing `n` to NOT increase, but you can see it detects headings
-- --  - `y` (yes): Replace this instance and continue to the next match.
-- --  - `n` (no): Do not replace this instance and continue to the next match.
-- --  - `a` (all): Replace all remaining instances without further prompting.
-- --  - `q` (quit): Quit without making any further replacements.
-- --  - `l` (last): Replace this instance and then quit
-- --  - `^E` (`Ctrl+E`): Scroll the text window down one line
-- --  - `^Y` (`Ctrl+Y`): Scroll the text window up one line
-- vim.keymap.set("n", "<leader>mhi", function()
--   -- Save the current cursor position
--   local cursor_pos = vim.api.nvim_win_get_cursor(0)
--   -- I'm using [[ ]] to escape the special characters in a command
--   vim.cmd([[:g/\(^$\n\s*#\+\s.*\n^$\)/ .+1 s/^#\+\s/#&/c]])
--   -- Restore the cursor position
--   vim.api.nvim_win_set_cursor(0, cursor_pos)
--   -- Clear search highlight
--   vim.cmd("nohlsearch")
-- end, { desc = "[P]Increase headings with confirmation" })

-- -- These are similar, but instead of adding an # they remove it
-- vim.keymap.set("n", "<leader>mhd", function()
--   -- Save the current cursor position
--   local cursor_pos = vim.api.nvim_win_get_cursor(0)
--   -- I'm using [[ ]] to escape the special characters in a command
--   vim.cmd([[:g/^\s*#\{2,}\s/ s/^#\(#\+\s.*\)/\1/c]])
--   -- Restore the cursor position
--   vim.api.nvim_win_set_cursor(0, cursor_pos)
--   -- Clear search highlight
--   vim.cmd("nohlsearch")
-- end, { desc = "[P]Decrease headings with confirmation" })

-- -- NOTE: Ignore this, it works out of the box, see
-- -- https://www.reddit.com/r/neovim/comments/1jozord/comment/mkvmp7s/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- -- To open markdown links, the cursor usually has to be in this position for gx
-- -- to work [link text](https://test<cursor>site.com)
-- -- I want to open links if I run gx in the `link text` section too lamw26wmal
-- --
-- -- Switched this keymap to an autocmd as links in non markdown files were not
-- -- being called correctly
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.keymap.set("n", "gx", function()
--       local line = vim.fn.getline(".")
--       local cursor_col = vim.fn.col(".")
--       local pos = 1
--       while pos <= #line do
--         local open_bracket = line:find("%[", pos)
--         if not open_bracket then
--           break
--         end
--         local close_bracket = line:find("%]", open_bracket + 1)
--         if not close_bracket then
--           break
--         end
--         local open_paren = line:find("%(", close_bracket + 1)
--         if not open_paren then
--           break
--         end
--         local close_paren = line:find("%)", open_paren + 1)
--         if not close_paren then
--           break
--         end
--         if
--           (cursor_col >= open_bracket and cursor_col <= close_bracket)
--           or (cursor_col >= open_paren and cursor_col <= close_paren)
--         then
--           local url = line:sub(open_paren + 1, close_paren - 1)
--           vim.ui.open(url)
--           return
--         end
--         pos = close_paren + 1
--       end
--       -- fallback to default gx behavior
--       vim.cmd("normal! gx")
--     end, { buffer = true, desc = "[P]Better URL opener for markdown" })
--   end,
-- })


--EOF 


