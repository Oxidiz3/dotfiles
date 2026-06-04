require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "eslint_d", "eslint-lsp" }

-- read :h vim.lsp.config for changing options of lsp servers 
--
local lspconfig = require("lspconfig")
local defaults = require("nvchad.configs.lspconfig")

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = defaults.on_attach,
    on_init = defaults.on_init,
    capabilities = defaults.capabilities,
  }
end

