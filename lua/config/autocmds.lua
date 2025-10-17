--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯
--
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.cmd([[
  augroup _general_settings
  autocmd!
  autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
  autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
  autocmd BufWinEnter * :set formatoptions-=cro
  autocmd FileType qf set nobuflisted
  augroup end

]])

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "**nagios*/*/*.cfg",
    "/*etc/nagios/*.cfg",
    "*groundwork/nagios/etc/*.cfg",
    "/var/lib/nagios/objects.cache",
  },
  callback = function()
    vim.bo.filetype = "nagios"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "**nagios*/*/*.cfg.j2",
  },
  callback = function()
    vim.bo.filetype = "nagios.jinja"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "**/playbooks/*.yml",
    "**/playbooks/*.yaml",
    "**/roles/*/tasks/*.yml",
    "**/roles/*/tasks/*.yaml",
    "**/roles/*/handlers/*.yml",
    "**/roles/*/handlers/*.yaml",
  },
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "**/inventory/**hosts",
  },
  callback = function()
    vim.bo.filetype = "conf"
  end,
})

-- Set type for systemd files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*.service*",
    "*.timer*",
  },
  callback = function()
    vim.bo.filetype = "systemd"
  end,
})

-- Disable autoformat for some files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "lua",
    "markdown",
  },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*i3/config",
    "*sway/config",
  },
  callback = function()
    vim.bo.filetype = "i3config"
    vim.bo.commentstring = "# %s"
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 500 })
  end,
})

-- Help window is vertical
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.txt" },
  callback = function()
    if vim.bo.filetype == "help" then
      vim.cmd.wincmd("L")
    end
  end,
})

-- Folding files and Persisting folds
-- https://github.com/LazyVim/LazyVim/discussions/1358

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*.*",
  callback = function()
    vim.cmd.mkview()
  end,
  group = save_fold,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.*",
  callback = function()
    vim.cmd.loadview({ mods = { emsg_silent = true } })
  end,
  group = save_fold,
})

-- close some filetypes with <esc>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "grug-far",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "dbout",
    "gitsigns-blame",
    "Lazy",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "<esc>", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- If you have an init.lua
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
-- Use the following if your buffer is set to become hidden
vim.api.nvim_create_autocmd("BufLeave", { pattern = "*.md", command = "silent! wall" })

-- ~/.config/nvim/lua/config/autocmds.lua
-- https://chatgpt.com/c/68f00a44-5820-832c-b8f3-522e3de7df63 
vim.filetype.add({
  pattern = {
    -- Match chezmoi template names like "dot_bashrc.tmpl" or "dot_bash_profile.tmpl"
    ["dot_bashrc%.tmpl"]       = "bash",
    ["dot_bash_profile%.tmpl"] = "bash",
    ["dot_bash_login%.tmpl"]   = "bash",
    ["dot_bash_aliases%.tmpl"] = "bash",
    ["dot_bash_exports%.tmpl"] = "bash",
    ["dot_profile%.tmpl"]      = "bash",
  },
})

-- Optional catch-all fallback if you have many dot_bash*.tmpl files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "dot_bash*.tmpl",
  callback = function()
    vim.bo.filetype = "bash"
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- args or args.data may be nil depending on who fires LspAttach
    local client_id = args and args.data and args.data.client_id
    if not client_id then return end

    local client = vim.lsp.get_client_by_id(client_id)
    if not client or client.name ~= "obsidian" then return end

    -- Cap tables differ across nvim versions; handle both
    local caps = client.server_capabilities or client.resolved_capabilities
    if not caps then return end

    -- New-style capability
    if caps.renameProvider ~= nil then
      caps.renameProvider = false
    end
    -- Old-style (pre-0.10) compatibility
    if caps.rename ~= nil then
      caps.rename = false
    end
  end,
})
