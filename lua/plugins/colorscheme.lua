return { -- You can easily change to a different colorscheme.
  "folke/tokyonight.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("tokyonight").setup {
      transparent = true,
    }
  end,
  init = function()
    vim.cmd.colorscheme "tokyonight-night"

    -- You can configure highlights by doing something like
    vim.cmd.hi "Comment gui=none"
  end,
}
