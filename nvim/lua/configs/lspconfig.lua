require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "python-lsp-server", "csharp-ls", "javscript", "typescript-language-server" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

-- Add root markers for ALL clients
vim.lsp.config('*', {
  root_markers = { '.git', '.hg' },
})

-- add capabilities to ALL clients
  vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  }
})
