local M = {}

M.ui = {
  theme = "solarized_dark", -- default theme
  transparency = false,

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
  },

  telescope = { style = "bordered" }, -- borderless / bordered
  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = false,
    lazyload = false,
  },
}

M.plugins = "nvchad.plugins"
return M
