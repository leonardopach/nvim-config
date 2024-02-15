local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

-- harpoon
local wk = require "which-key"
wk.register {
  ["<leader>he"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Search File" },
  ["<leader>ha"] = { "<cmd>lua require('plugins.harpoon') Mark_file()<cr>", "Mark File" },
}

function Mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end

return M
