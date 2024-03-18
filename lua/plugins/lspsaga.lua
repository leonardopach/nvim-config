return {
  "glepnir/lspsaga.nvim",

  config = function()
    local status, saga = pcall(require, "lspsaga")
    if not status then
      return
    end
    local wk = require "which-key"
    wk.register {
      ["F"] = { "<cmd>Lspsaga finder<CR>", "Finder" },
      ["K"] = { "<cmd>Lspsaga hover_doc<CR>" },
      ["<leader>lf"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
    }
    saga.setup {
      server_filetype_map = {
        typescript = " typescript",
      },
    }
  end,
}
