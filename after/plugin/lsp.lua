local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pyright.setup {
    capabilities = capabilities
}

lspconfig.jdtls.setup {
    capabilities = capabilities
}

lspconfig.lua_ls.setup({
    capabilities = capabilities, -- Preserve existing capabilities
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }, -- Tell LSP that 'vim' is a global variable
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Make LSP aware of Neovim runtime files
                checkThirdParty = false,                           -- Prevent annoying third-party module warnings
            },
            telemetry = {
                enable = false, -- Disable telemetry to improve performance
            },
        },
    },
})

lspconfig.html.setup {
    capabilities = capabilities
}

lspconfig.cssls.setup {
    capabilities = capabilities
}

lspconfig.ts_ls.setup {
    capabilities = capabilities
}

lspconfig.clangd.setup {
    capabilities = capabilities
}

lspconfig.jsonls.setup {
    capabilities = capabilities
}
