require "nvchad.mappings"
local opts = { noremap = true, silent = true }
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<c-a>", "ggVG", { desc = "Select All" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- debuug
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Run or continue the debugger" })
-- tmux
map("n", "<C-h>", "<cmd>lua require('tmux').move_left()<cr>", opts)
map("n", "<C-l>", "<cmd>lua require('tmux').move_right()<cr>", opts)
map("n", "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>", opts)
map("n", "<C-k>", "<cmd>lua require('tmux').move_top()<cr>", opts)

-- harpoon
map("n", "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Search File" })
map("n", "<leader>ha", "<cmd>lua require('nvchad.plugins.harpoon') Mark_file()<cr>", { desc = "Mark File" })

-- move Lines
map("n", "<A-Down>", ":MoveLine(1)<CR>", opts)
map("n", "<A-Up>", ":MoveLine(-1)<CR>", opts)
map("v", "<A-Down>", ":MoveBlock(1)<CR>", opts)
map("v", "<A-Up>", ":MoveBlock(-1)<CR>", opts)

-- refactoring
map("x", "<leader>re", ":Refactor extract ")
map("x", "<leader>rf", ":Refactor extract_to_file ")
map("x", "<leader>rv", ":Refactor extract_var ")
map({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
map("n", "<leader>rI", ":Refactor inline_func")
map("n", "<leader>rb", ":Refactor extract_block")
map("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- geral
map("n", "q", ":q<CR>", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)
map("n", "<c-t>", ":TodoTelescope<cr>", opts)

-- more good
map({ "n", "o", "x" }, "<s-h>", "^", opts)
map({ "n", "o", "x" }, "<s-l>", "g_", opts)
