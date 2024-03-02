local M = {
  "CRAG666/code_runner.nvim",
}

function M.config()
  local code = require "code_runner"
  code.setup {
    filetype = {
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt",
      },
      python = "python3 -u",
      -- typescript = "node run",
      typescript = "bun run",
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt",
      },
    },
  }
  vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
end
return M
