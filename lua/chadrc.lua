local M = {}

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "palenight",
  transparency = false,
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "simple", -- colored / simple
  },

  telescope = { style = "borderless" }, -- borderless / bordered
  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = false,
    lazyload = false,
  },
}

M.plugins = "nvchad.plugins"
M.lazy_nvim = require "nvchad.configs.lazy_nvim" -- config for lazy.nvim startup options
return M
