return {
  "LukasPietzschmann/telescope-tabs",
  event = "VeryLazy",
  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>aa"] = {
        "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
        "[F]ind Tabs",
      },
    }

    require("telescope-tabs").setup {
      show_preview = true,
      close_tab_shortcut_i = "<C-d>", -- if you're in insert mode
      close_tab_shortcut_n = "dd", -- if you're in normal mode
      entry_formatter = function(tab_id, file_names, is_current)
        local entry_string = table.concat(file_names, ", ")
        return string.format("%d: %s%s", tab_id, entry_string, is_current and " " or "")
      end,
    }
  end,
}
