local M = {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  require("colorizer").setup {
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "css",
      "html",
      "astro",
      "lua",
      "*",
    },
    user_default_options = {
      names = true,
      rgb_fn = true,
      hsl_fn = true,
      "*",
      tailwind = true,
    },
    buftypes = {},
  }
end

return M
