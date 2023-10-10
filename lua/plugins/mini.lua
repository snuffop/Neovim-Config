-- Require Plugin
local installed, surround = pcall(require, "mini.surround")
if not installed then
    vim.notify("Plugin 'mini-surround' is not installed")
    return
end

local installed, comment = pcall(require, "mini.comment")
if not installed then
    vim.notify("Plugin 'mini-comment' is not installed")
    return
end

local installed, pairs = pcall(require, "mini.pairs")
if not installed then
    vim.notify("Plugin 'mini-pairs' is not installed")
    return
end

surround.setup()
comment.setup()
pairs.setup()
