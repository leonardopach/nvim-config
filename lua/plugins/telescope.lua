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
    ["<leader>f?"] = {
      function()
        require("telescope.builtin").help_tags()
      end,
      "Helps Tags",
    },
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
    ["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    ["<leader>fd"] = {
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      "Goto Definitions",
    },
    ["<leader>fr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "Goto References",
    },
    ["<leader>f/"] = {
      function()
        require("telescope.builtin").live_grep {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        }
      end,
      "[S]earch [/] in Open Files",
    },
  }

  -- local icons = require "user.icons"
  local actions = require "telescope.actions"
  local fb_actions = require("telescope").extensions.file_browser.actions

  require("telescope").setup {

    defaults = {
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "truncate" },
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
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      -- path_display = { "smart" },
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
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
