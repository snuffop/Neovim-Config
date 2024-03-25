-- CMAP lua save via sudo 

vim.cmd[[ cnoreabbrev w!! w !sudo tee % > /dev/null ]]

-- Keymaps 

vim.keymap.set({"i"}, "<C-L>", "<Plug>luasnip-expand-or-jump<cr>", {silent = true})
vim.keymap.set({"i", "s" }, "<C-J>", "<Plug>luasnip-jump-prev<cr>", {silent = true})
vim.keymap.set({"i", "s" }, "<C-K>", "<Plug>luasnip-next-choice<cr>", {silent = true})

-- Oil - 
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { silent = true, desc = "Open parent directory"})

-- Disable F1 --
vim.keymap.set("n", "<F1>", "<nop>")

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- TmuxNavigate
keymap('n', "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap('n', "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap('n', "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts)
keymap('n', "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts)

-- Spelling
keymap("n", "<F3>", ":set spell!<CR>", opts)
keymap("i", "<F3>", "<C-O>:set spell!<CR>", opts)

keymap("n", ";w", "<cmd>up<cr>", opts)
keymap("n", ";q", "<cmd>confirm quit<cr>",opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers 
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Yank to clipboard
keymap({"n","v"}, "<leader>y", '"+yy', opts)
keymap("n", "<leader>Y", '"+Y', opts)

keymap("n", "<leader>d", '_d', opts)

-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Whichkey  maps based on mode
vim.cmd([[
nnoremap <M-k> <cmd>WhichKey<cr>
vnoremap <M-k> <cmd>WhichKey '' v<cr>
inoremap <M-k> <cmd>WhichKey '' i<cr>
cnoremap <M-k> <cmd>WhichKey '' c<cr>
]])

