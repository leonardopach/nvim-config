local M = {
  "fedepujol/move.nvim",
}

function M.config()
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
  -- Normal-mode commands
  vim.keymap.set("n", "<A-Down>", ":MoveLine(1)<CR>", opts)
  vim.keymap.set("n", "<A-Up>", ":MoveLine(-1)<CR>", opts)
  -- Visual-mode commands
  vim.keymap.set("v", "<A-Down>", ":MoveBlock(1)<CR>", opts)
  vim.keymap.set("v", "<A-Up>", ":MoveBlock(-1)<CR>", opts)
end

return M
