local neotest = require "neotest"

neotest.setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
    },
    require "neotest-rust" {},
    require "neotest-vitest",
    require "neotest-zig",
    require "neotest-vim-test" {
      ignore_file_types = { "python", "vim", "lua", "javascript" },
    },
  },
}
