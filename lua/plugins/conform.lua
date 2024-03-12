local M = {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this output
}

function M.config()
  local conform = require "conform"

  conform.setup {
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang-format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      ["*"] = { "codespell" },
    },
    format_on_save = {
      pattern = ".lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.rs,*.ejs",
      lsp_fallback = true,
      timeout_ms = 500,
    },
  }
end

return M
