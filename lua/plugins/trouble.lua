return {
  "folke/trouble.nvim",

  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>ld"] = { "<cmd>Trouble<cr>", "Diagnostics" },
      ["<leader>lt"] = { "<cmd>TodoTrouble<cr>", "TODO" },
    }
  end,
}
