local M = {}

M.treesitter = {
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = { "html", "xml" },
  },
  ensure_installed = {
    "html",
    "css",
    "bash",
    "lua",
    "c",
    "javascript",
    "rust",
    "typescript",
    "vue",
    "json",
    "vim",
    "tsx",
    "zig",
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "html-lsp",
    "prettier",
    "emmet-ls",
    "stylua",
    "eslint-lsp",
    "js-debug-adapter",
    "tailwindcss-language-server",
    "typescript-language-server",
  },
}

return M
