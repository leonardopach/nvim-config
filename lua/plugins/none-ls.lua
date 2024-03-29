local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.rustfmt,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      formatting.eslint,
      -- diagnostics.rust_analyzer,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
