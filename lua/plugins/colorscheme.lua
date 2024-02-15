local M = {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  opts = {},
}
function M.config()
  vim.cmd "colorscheme rose-pine"
end

return M
