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
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      css = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
    },
    format_on_save = {
      pattern = ".lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.rs,",
      lsp_fallback = true,
      timeout_ms = 500,
    },
  }
end

return M
