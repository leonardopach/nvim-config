local navbuddy = require "nvim-navbuddy"
navbuddy.setup {
  window = {
    border = "rounded",
  },
  icons = require("custom.configs.icons").kind,
  lsp = { auto_attach = true },
}
