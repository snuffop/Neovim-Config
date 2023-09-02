-- Neogit
local installed, NeoGit = pcall(require, "neogit")
if not installed then
	vim.notify("Plugin 'NeoGit' is not installed")
	return
end

NeoGit.setup({
	commit_confirmation = {
		enabled = true,
		close_on_deny = false,
	},
	mappings = {
		status = {
			["p"] = "PushPopup",
			["F"] = "PullPopup",
		},
	},
	integrations = {
		diffview = true,
		telescope = true,
	},
})
