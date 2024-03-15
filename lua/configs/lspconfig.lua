local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local lspconfig = require "lspconfig"
local servers = {
  "lua_ls",
  "cssls",
  "html",
  "clangd",
  "tsserver",
  "tailwindcss",
  "eslint",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
}
local wk = require "which-key"
wk.register {
  ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
  ["<leader>lh"] = { "<cmd>lua require('nvchad.configs.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
  ["<leader>lo"] = { "<cmd>TSToolsOrganizeImports<cr>", "Organizar Importe JS" },
  ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
  ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
  ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
}
local default_diagnostic_config = {
  signs = {
    active = true,
  },
  virtual_text = false,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(default_diagnostic_config)

require("lspconfig.ui.windows").default_options.border = "rounded"
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
