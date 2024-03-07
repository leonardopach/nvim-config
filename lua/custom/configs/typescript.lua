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
    publish_diagnostic_on = "insert_leave",
    -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
    -- "remove_unused_imports"|"organize_imports") -- or string "all"
    -- to include all supported code actions
    expose_as_code_action = "all",
    -- specify commands exposed as code_actions
    -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
    -- not exists then standard path resolution strategy is applied
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
      allowRenameOfImportPath = true,

      includeCompletionsForModuleExports = true,
      quotePreference = "auto",

      -- autoImportFileExcludePatterns = { "node_modules/*", ".git/*" },
    },
    tsserver_format_options = {
      allowIncompleteCompletions = false,
      allowRenameOfImportPath = true,
    },
    jsx_close_tag = {
      enable = true,
      filetypes = { "javascriptreact", "typescriptreact" },
    },
  },
}
