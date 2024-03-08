local miniclue = require "mini.clue"
miniclue.setup {
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    -- Built-in completion
    { mode = "i", keys = "<C-x>" },
    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "n", keys = "<C-w>" },
    { mode = "c", keys = "<C-r>" },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    { mode = "n", keys = "<leader>a", desc = "Empty tab" },
    { mode = "n", keys = "<leader>c", desc = "Git Commits " },
    { mode = "n", keys = "<leader>d", desc = "Debbuger" },
    { mode = "n", keys = "<leader>f", desc = "Telescope " },
    { mode = "n", keys = "<leader>g", desc = "Neogit " },
    { mode = "n", keys = "<leader>h", desc = "Harpoon " },
    { mode = "n", keys = "<leader>l", desc = "Lsp" },
    { mode = "n", keys = "<leader>m", desc = "MiniFile" },
    { mode = "n", keys = "<leader>p", desc = "Pick hidden term " },
    { mode = "n", keys = "<leader>p", desc = "Pick hidden term " },
    { mode = "n", keys = "<leader>t", desc = "Testing" },
    { mode = "n", keys = "<leader>w", desc = "workspace" },
    { mode = "n", keys = "<leader>r", desc = "Rename" },

    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.windows { submode_resize = true },
    miniclue.gen_clues.g(),
    miniclue.gen_clues.registers(),
  },

  window = {
    delay = 100,
    config = {
      width = "auto",
      border = "double",
    },
  },
}
