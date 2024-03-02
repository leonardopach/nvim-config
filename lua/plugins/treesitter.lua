local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  local treesitter = require "nvim-treesitter.configs"

  treesitter.setup {
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true,
      filetypes = { "html", "xml" },
    },
    ensure_installed = {
      "lua",
      "markdown",
      "rust",
      "go",
      "javascript",
      "bash",
      "html",
      "json",
      "c",
      "typescript",
      "css",
      "scss",
      "json",
      "graphql",
      "markdown",
      "vue",
      "yaml",
      "html",
    },
    sync_install = false,
    ignore_install = {},
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return M
