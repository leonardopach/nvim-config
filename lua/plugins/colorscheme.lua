local M = {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
}
function M.config()
  local rose = require "rose-pine"
  rose.setup {
    styles = {
      bold = true,
      italic = true,
      transparency = true,
    },
  }
  vim.cmd "colorscheme rose-pine"
end

return M
