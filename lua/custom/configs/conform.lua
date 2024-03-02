local plugin = require "conform"

plugin.setup {
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
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
