dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled())
  end

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local lspconfig = require "lspconfig"
local servers = {
  "lua_ls",
  "jsonls",
  "emmet_ls",
  "html",
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }

  local require_ok, settings = pcall(require, "custom.configs.lspsettings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", settings, opts)
  end

  if server == "lua_ls" then
    require("neodev").setup {}
  end

  lspconfig[server].setup(opts)
end
-- require("lspconfig").lua_ls.setup {
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
--
--   settings = {
--     Lua = {
--       format = {
--         enable = true,
--       },
--       diagnostics = {
--         globals = { "vim" },
--       },
--       runtime = {
--         version = "LuaJIT",
--         special = {
--           spec = "require",
--         },
--       },
--       workspace = {
--         library = {
--           [vim.fn.expand "$VIMRUNTIME/lua"] = true,
--           [vim.fn.stdpath "config" .. "/lua"] = true,
--           [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
--           [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
--           [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
--         },
--         -- maxPreload = 100000,
--         -- preloadFileSize = 10000,
--       },
--       hint = {
--         enable = true,
--         arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
--         await = true,
--         paramName = "All", -- "All" | "Literal" | "Disable"
--         paramType = true,
--         semicolon = "All", -- "All" | "SameLine" | "Disable"
--         setType = true,
--       },
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
--
return M
