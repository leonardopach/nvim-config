return {
  "SmiteshP/nvim-navbuddy",
  lazy = false,
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>o"] = { "<cmd>Navbuddy<cr>", "Nav" },
    }

    local navbuddy = require "nvim-navbuddy"
    -- local actions = require("nvim-navbuddy.actions")
    navbuddy.setup {
      window = {
        border = "rounded",
      },
      icons = require("users.icons").kind,
      lsp = { auto_attach = true },
    }

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap("n", "<m-s>", ":silent only | Navbuddy<cr>", opts)
    keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts)
  end,
}
