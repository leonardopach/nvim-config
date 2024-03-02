local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
}

function M.config()
  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "eslint",
    "gopls",
    "clangd",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
  require("mason-tool-installer").setup {
    ensure_installed = {
      "lua-language-server",
      "stylua",
      "eslint_d",
      "clang-format",
      "codelldb",
      "prettierd",
      "rust-analyzer",
      "bash-language-server",
      "typescript-language-server",
      "eslint-lsp",
      "js-debug-adapter",
      "prettier",
    },
  }
end

return M
