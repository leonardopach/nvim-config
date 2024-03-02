local M = {
  "windwp/nvim-ts-autotag",
  lazy = false,
}

function M.config()
  local config = require "nvim-treesitter.configs"
  config.setup {
    filetypes = { "html", "xml" },
  }
end

return M
