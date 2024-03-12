local M = {
  "glepnir/lspsaga.nvim",
}

function M.config()
  local status, saga = pcall(require, "lspsaga")
  if not status then
    return
  end
  local wk = require "which-key"
  wk.register {
    ["F"] = { "<cmd>Lspsaga finder<CR>", "Finder" },
    ["<leader>lf"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
  }
  saga.setup {
    server_filetype_map = {
      typescript = " typescript",
    },
  }
end

return M
