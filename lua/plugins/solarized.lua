local M = {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  day_brightness = 0.6,
  config = function()
    require("solarized-osaka").setup {
      transparent = false,
      terminal_colors = true,
    }
    vim.cmd [[colorscheme solarized-osaka]]
  end,
}

return M
