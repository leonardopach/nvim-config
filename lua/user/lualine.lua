local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "filename" },
      lualine_c = { "diagnostics" },
      lualine_x = { "tabnine", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        {
          "datetime",
          style = "default",
        },
      },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
