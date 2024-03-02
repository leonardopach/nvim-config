local M = {}

M.general = {
  n = {
    ["<c-a>"] = { "ggVG", "Select All" },
    ["x"] = { "_x>", "Delete" },
    ["<leader>q"] = { ":q<CR>", "Quit" },
    ["n"] = { "nzz" },
    ["N"] = { "Nzz" },
    ["*"] = { "*zz" },
    ["#"] = { "#zz" },
    ["g*"] = { "g*zz" },
    ["g#"] = { "g#zz" },
    ["<s-h>"] = { "^", "jump start" },
    ["<s-l>"] = { "g_", "jump end" },
    ["<leader>an"] = { "<cmd>$tabnew<cr>", "New Empty Tab" },
    ["<tab>"] = { "<cmd>tabNext<cr>", "Next Tab" },
  },
  i = {
    ["<c-a>"] = { "ggVG", "Select All" },
  },
}

M.tmux = {
  plugin = true,
  n = {
    ["<c-h>"] = { "<cmd>lua require('tmux').move_left()<cr>", "Move Left" },
    ["<c-l>"] = { "<cmd>lua require('tmux').move_right()<cr>", "Move right" },
    ["<c-j>"] = { "<cmd>lua require('tmux').move_bottom()<cr>", "Move bottom" },
    ["<c-k>"] = { "<cmd>lua require('tmux').move_top()<cr>", "Move top" },
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger",
    },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>he"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Search File" },
    ["<leader>ha"] = { "<cmd>lua require('custom.configs.harpoon') Mark_file()<cr>", "Mark File" },
  },
}
M.move = {
  plugin = true,
  n = {
    ["<a-down>"] = { ":MoveLine(1)<CR>", "Move Line Down" },
    ["<a-up>"] = { ":MoveLine(-1)<CR>", "Move Line Up" },
  },
  v = {
    ["<a-down>"] = { ":MoveBlock(1)<CR>", "Move Line Down" },
    ["<a-up>"] = { ":MoveBlock(-1)<CR>", "Move Line Up" },
  },
}

M.incRename = {
  plugin = true,
  n = {
    ["<leader>rn"] = { ":IncRename ", "Lsp renaming" },
  },
}

M.neotest = {
  plugin = true,
  n = {
    ["<leader>tt"] = { "<cmd>lua require'neotest'.run.run()<cr>", "Test Nearest" },
    ["<leader>tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Test File" },
    ["<leader>td"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Test" },
    ["<leader>ts"] = { "<cmd>lua require('neotest').run.stop()<cr>", "Test Stop" },
    ["<leader>ta"] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach Test" },
  },
}

M.telescope_file = {
  plugin = true,
  n = {
    ["<leader>fh"] = {
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
      "open with the path of current buffer",
    },
  },
}

M.codeRunner = {
  plugin = true,
  n = {
    ["<leader>r"] = { ":RunCode<CR>", "Code runner", { noremap = true, silent = false } },
  },
}

M.navbuddy = {
  plugin = true,
  n = {
    ["<leader>o"] = { "<cmd>Navbuddy<cr>", "Nav" },
  },
}
M.neogit = {
  plugin = true,
  n = {
    ["<leader>gg"] = { "<cmd>Neogit<CR>", "Neogit" },
  },
}
M.gitlinker = {
  plugin = true,
  n = {
    ["<leader>gy"] = { "<cmd>GitLink!<cr>", "Git link" },
    ["<leader>gY"] = { "<cmd>GitLink blame<cr>", "Git link blame" },
  },
}
return M
