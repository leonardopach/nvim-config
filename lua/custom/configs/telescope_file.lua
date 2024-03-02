local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup {
  extensions = {
    file_browser = {
      -- theme = "ivy",
      mappings = {
        ["i"] = {
          ["<S-r>"] = fb_actions.rename,
          ["<S-h>"] = fb_actions.goto_home_dir,
          ["<S-a>"] = fb_actions.create,
          ["<S-y>"] = fb_actions.copy,
          ["<S-d>"] = fb_actions.remove,
          ["<S-m>"] = fb_actions.move,
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
}
require("telescope").load_extension "file_browser"
