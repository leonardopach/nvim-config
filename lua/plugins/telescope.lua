local M = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      lazy = true,
    },
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
}
function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>bb"] = { "<cmd>Telescope buffers previewer=true<cr>", "Find" },
    ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["<leader>fh"] = {
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
      "open with the path of current buffer",
    },
    ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
    ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  }

  -- local icons = require "user.icons"
  local actions = require "telescope.actions"
  local fb_actions = require("telescope").extensions.file_browser.actions

  require("telescope").setup {

    defaults = {
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
    },
    mappings = {
      i = {

        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<esc>"] = actions.close,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["q"] = actions.close,
      },
    },
    extensions = {
      file_browser = {
        -- theme = "ivy",
        mappings = {
          ["i"] = {
            ["<S-r>"] = fb_actions.rename,
            ["<S-h>"] = fb_actions.goto_home_dir,
            ["<S-a>"] = fb_actions.create,
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
end
return M
