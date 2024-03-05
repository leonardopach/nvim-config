local M = {}

M.ui = {
  theme = "bearded-arc",
  transparency = false,
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = { "notify" }, -- these aren't compiled by default, ex: "alpha", "notify"

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },
  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    separator_style = "default",
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = false,
    lazyload = false,
    overriden_modules = nil,
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.configs.mappings"
M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

return M
