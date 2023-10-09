-- Project
local installed, Project = pcall(require, "project_nvim")
if not installed then
    vim.notify("Plugin 'project_nvim' is not installed")
    return
end

Project.setup({
    silet_chdir = false,
})

require("telescope").load_extension("projects")
