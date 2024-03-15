return {
  "ThePrimeagen/refactoring.nvim",
  lazy = false,
  keys = {
    {
      "<leader>r",
      function()
        require("refactoring").select_refactor {
          show_success_message = true,
        }
      end,
      mode = "v",
      noremap = true,
      silent = true,
      expr = false,
    },
  },
  opts = {
    prompt_func_return_type = {
      javascript = true,
      typescript = true,
    },
    prompt_func_param_type = {
      javascript = true,
      typescript = true,
    },
  },
}
