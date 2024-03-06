local lspconfig = require "plugins.configs.lspconfig"
require("typescript-tools").setup {
  on_attach = function(client, bufnr)
    lspconfig.on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = lspconfig.common_capabilities(),
  settings = {
    separate_diagnostic_server = true,
    expose_as_code_action = "all",
    -- tsserver_plugins = {},
    tsserver_max_memory = "auto",
    -- complete_function_calls = true,
    include_completions_with_insert_text = true,
    -- code_lens = "all",
    -- disable_member_code_lens = true,

    -- described below
    -- tsserver_format_options = {},

    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all", -- "none" | "literals" | "all";
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,

      includeCompletionsForModuleExports = true,
      quotePreference = "auto",

      -- autoImportFileExcludePatterns = { "node_modules/*", ".git/*" },
    },

    jsx_close_tag = {
      enable = true,
      filetypes = { "javascriptreact", "typescriptreact" },
    },
  },
}
