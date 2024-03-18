return {
  "CRAG666/code_runner.nvim",
  config = function()
    local code = require "code_runner"
    code.setup {
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt",
        },
        python = "python3 -u",
        typescript = "deno run",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt",
        },
      },
    }
    vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
  end,
}
