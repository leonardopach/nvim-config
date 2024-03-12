local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>lI"] = { "<cmd>Mason<cr>", "Mason Info" },
  }
  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "tsserver",
    "astro",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    "tailwindcss",
    "rust_analyzer",
    "eslint",
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
