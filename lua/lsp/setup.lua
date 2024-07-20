require("plugins")
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup({
    ensured_installed = {},
    automatic_installation = true,
})

lspconfig.lua_ls.setup {}
lspconfig.clangd.setup {}
--lspconfig.rust_analyzer.setup {}
--lspconfig.gopls.setup {}
--lspconfig.pyright.setup {}
--lspconfig.yamlls.setup {}
--lspconfig.bashls.setup {}
lspconfig.cmake.setup {}
