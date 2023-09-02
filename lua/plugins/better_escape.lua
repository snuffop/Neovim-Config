-- requiring necessary functions
local installed, BetterEscape = pcall(require, "better_escape")
if not installed then
	vim.notify("Plugin 'better_escape' not installed")
end

BetterEscape.setup({
	mapping = { "jk", "jj", "kk", "kj" },
	timeout = 100,
})
