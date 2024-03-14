return {
  "fedepujol/move.nvim",
  lazy = false,
  config = function()
    local move = require "move"

    move.setup {
      line = {
        enable = true, -- Enables line movement
        indent = true, -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true, -- Toggles indentation
      },
      word = {
        enable = true, -- Enables word movement
      },
      char = {
        enable = false, -- Enables char movement
      },
    }
    local opts = { noremap = true, silent = true }
  end,
}
