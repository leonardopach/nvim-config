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
  require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"eslint_d",
				"prettierd",
				"rust-analyzer",
				"bash-language-server",
			},
		})
end

return M
