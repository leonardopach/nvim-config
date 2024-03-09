local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "clangd",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
}
lspconfig.tailwindcss.setup {}
for _, lsp in pairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  lspconfig[lsp].setup(opts)
end
