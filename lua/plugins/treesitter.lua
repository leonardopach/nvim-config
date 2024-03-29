local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = {
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
    sync_install = true,
    ignore_install = {},
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}

return M
