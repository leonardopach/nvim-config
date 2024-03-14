local M = {}
local map = vim.keymap.set
local conf = require("nvconfig").ui.lsp

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end
  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled())
    vim.api.nvim_set_hl(0, "LSPInlayHint", { fg = "grey" })
  end
  map("n", "gD", vim.lsp.buf.declaration, opts "Lsp Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Lsp Go to definition")
  map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
  map("n", "gi", vim.lsp.buf.implementation, opts "Lsp Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Lsp Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Lsp Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Lsp Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "Lsp List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Lsp Go to type definition")

  map("n", "<leader>ra", function()
    require "nvchad.lsp.renamer"()
  end, opts "Lsp NvRenamer")

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Lsp Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Lsp Show references")

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end
M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end
-- disable semanticTokens
M.on_init = function(client, _)
  if not conf.semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem = {
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
  return capabilities
end
M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  require "nvchad.lsp"

  local lspconfig = require "lspconfig"
  local servers = {
    "lua_ls",
  }

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    }
    local require_ok, settings = pcall(require, "nvchad.plugins.lsp." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end
    if server == "lua_ls" then
      require("neodev").setup {}
    end
    lspconfig[server].setup(opts)
  end
end
return M
