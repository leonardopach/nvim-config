local M = {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
}

function M.config()
  require("project_nvim").setup {
    active = true,
    on_config_done = nil,
    manual_mode = false,
    detection_methods = { "pattern", "lsp" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml", "Cargo.toml" },
    ignore_lsp = {},
    exclude_dirs = { "~/.cargo/*" },
    show_hidden = false,
    silent_chdir = true,
    scope_chdir = "global",
  }

  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("n", "<c-p>", ":lua require('telescope').extensions.projects.projects()<CR>", opts)
end

return M