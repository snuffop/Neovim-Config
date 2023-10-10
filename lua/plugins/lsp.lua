-- requiring necessary plugins
-- mason
local installed, Mason = pcall(require, "mason")
if not installed then
    vim.notify("Plugin 'mason' not installed ")
    return
end

-- Mason lspconfig
local installed, MasonLspConfig = pcall(require, "mason-lspconfig")
if not installed then
    vim.notify("Plugin 'mason-lspconfig' not installed ")
    return
end

-- Mason nvim dap
local installed, MasonNvimDap = pcall(require, "mason-nvim-dap")
if not installed then
    vim.notify("Plugin 'mason-nvim-dap' not installed ")
    return
end

-- Mason tool installer
local installed, MasonToolInstaller = pcall(require, "mason-tool-installer")
if not installed then
    vim.notify("Plugin 'mason-tool-installer' not installed ")
    return
end

-- #############################################################################
-- Lsp config
local installed, LspConfig = pcall(require, "lspconfig")
if not installed then
    vim.notify("Plugin 'lspconfig' not installed ")
    return
end

-- cmp_nvim_lsp
local installed, CmpNvimLsp = pcall(require, "cmp_nvim_lsp")
if not installed then
    vim.notify("Plugin 'mason-tool-installer' not installed")
    return
end

-- #############################################################################
-- Setting up plugins

Mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

-- Masong Lsp config

MasonLspConfig.setup({
    ensure_installed = {
        "bashls",
        "cssls",
        "cssls",
        "dockerls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "mutt_ls",
        "pyright",
        "vimls",
        "yamlls"
    },
})

-- Mason automatically installs required tools for nvim-dap
MasonNvimDap.setup({
    ensure_installed = { "python", "stylua" },
    handlers = {}, -- sets up dap in the predefined manner
})

-- Mason Tool Installer
MasonToolInstaller.setup({
    -- a list of all tools you want to ensure are installed upon
    -- start; they should be the names Mason uses for each tool
    ensure_installed = {
        -- you can turn off/on auto_update per tool
        { "ansiblels",                        auto_update = true },
        { "awk-ls",                           auto_update = true },
        { "bashls",                           auto_update = true },
        { "cssls",                            auto_update = true },
        { "docker-compose-language-service",  auto_update = true },
        { "dockerls",                         auto_update = true },
        { "html",                             auto_update = true },
        { "jsonls",                           auto_update = true },
        { "mutt-language-server",             auto_update = true },
        { "stylua",                           auto_update = true },
        { "vimls",                            auto_update = true },
        { "yamlls",                           auto_update = true },
    },

    auto_update = false,
    run_on_start = true,
    start_delay = 3000, -- 3 second delay
    debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

-- #############################################################################
-- Managing language servers individually

local capabilities = CmpNvimLsp.default_capabilities()

-- Ansible Language Server 
LspConfig.ansiblels.setup({
    capabilities = capabilities,
})

-- awk Language Server 
LspConfig.awk_ls.setup({
    capabilities = capabilities,
})

-- Bash
LspConfig.bashls.setup({
    capabilities = capabilities,
})

-- CSS LS
LspConfig.cssls.setup({
    capabilities = capabilities,
})

-- Dockerfile
LspConfig.dockerls.setup({
    capabilities = capabilities,
})

-- Docker Compose
LspConfig.docker_compose_language_service.setup({
    capabilities = capabilities,
})

-- html
LspConfig.html.setup({
    capabilities = capabilities,
})

-- Lua LS
LspConfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

-- mutt language server
LspConfig.mutt_ls.setup({
    capabilities = capabilities,
})

-- pyright
LspConfig.pyright.setup({
    capabilities = capabilities,
})

-- tsserver
LspConfig.tsserver.setup({
    capabilities = capabilities,
})

-- rust_analyzer
LspConfig.rust_analyzer.setup({
    capabilities = capabilities,
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ["rust-analyzer"] = {},
    },
})

-- Tailwind
-- Support for tailwind auto completion
-- install the tailwind server : "sudo npm install -g @tailwindcss/language-server"
LspConfig.tailwindcss.setup({
    capabilities = capabilities,
})
