local overrides = require "custom.configs.overrides"
local plugins = {
  {
    "echasnovski/mini.notify",
    version = false,
    config = function()
      require "custom.configs.notify"
    end,
  },
  -- clue
  {
    "echasnovski/mini.clue",
    version = false,
    config = function()
      require "custom.configs.miniclue"
    end,
  },
  --mini surround
  { "echasnovski/mini.surround", version = false, opts = {} },
  { "b0o/schemastore.nvim" },
  -- rust
  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    ft = { "rust" },
    config = function()
      require "custom.configs.rustacean"
    end,
  },
  --tsc
  {
    "dmmulroy/tsc.nvim",
  },
  -- trouble
  {
    "folke/trouble.nvim",
    lazy = false,
    config = function()
      require("core.utils").load_mappings "trouble"
    end,
  },
  -- tailwindcss
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
  -- auto tag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require "custom.configs.autotag"
    end,
  },

  -- netrw
  {
    "prichrd/netrw.nvim",
    lazy = false,
    config = function()
      require "custom.configs.netrw"
    end,
  },
  -- Auto indent jsx
  {
    "tpope/vim-sleuth",
    "MaxMEllon/vim-jsx-pretty",
  },
  -- typescript-tools
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require "custom.configs.typescript"
    end,
  },
  -- diffview
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      require "custom.configs.diffview"
    end,
  },

  -- TODO: comment
  -- FIX: aqui
  -- HACK: aqui
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.todo"
    end,
  },

  {
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth
  },
  --bqf
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    config = function()
      require "custom.configs.bqf"
    end,
  },
  -- modificato
  {
    "mawkler/modicator.nvim",
    event = "BufEnter",
    lazy = "false",
    config = function()
      require "custom.configs.modicator"
    end,
  },
  -- gitlinker
  {
    "linrongbin16/gitlinker.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    event = "VeryLazy",
    config = function()
      require "custom.configs.gitlinker"
      require("core.utils").load_mappings "gitlinker"
    end,
  },
  -- neogit
  {
    "neogitorg/neogit",
    event = "VeryLazy",
    config = function()
      require "custom.configs.neogit"
      require("core.utils").load_mappings "neogit"
    end,
  },
  -- tabby
  {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.tabby"
    end,
  },
  -- navbuddy
  {
    "SmiteshP/nvim-navbuddy",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "custom.configs.navbuddy"
      require("core.utils").load_mappings "navbuddy"
    end,
  },
  -- neoscroll
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require "custom.configs.neoscroll"
    end,
  },
  -- Code runner
  {
    "CRAG666/code_runner.nvim",
    lazy = false,
    config = function()
      require "custom.configs.codeRunner"
      require("core.utils").load_mappings "codeRunner"
    end,
  },
  -- telescope-file-browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.telescope_file"
      require("core.utils").load_mappings "telescope_file"
    end,
  },
  -- debbug
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    opts = {},
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings "dap"
    end,
  },
  -- Illuminatte
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require "custom.configs.illuminate"
    end,
  },
  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require "custom.configs.harpoon"
      require("core.utils").load_mappings "harpoon"
    end,
  },

  -- Tmux
  {
    "aserowy/tmux.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.tmux"
      require("core.utils").load_mappings "tmux"
    end,
  },
  -- Move
  {
    "fedepujol/move.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.move"
      require("core.utils").load_mappings "move"
    end,
  },
  -- conform
  {
    "stevearc/conform.nvim",
    event = { "VeryLazy", "BufReadPre", "BufNewFile" }, -- to disable, comment this output
    opts = {},
    config = function()
      require "custom.configs.conform"
    end,
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = overrides.treesitter,
  },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- lint
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  -- Mason
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    dependencies = {
      {
        "folke/neodev.nvim",
      },
    },
  },

  -- auto-tag
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- vim-visual-multi
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    lazy = false,
    config = function()
      require "custom.configs.incRename"
      require("core.utils").load_mappings "incRename"
    end,
  },
  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = false,
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor {
            show_success_message = true,
          }
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {
      prompt_func_return_type = {
        javascript = true,
        typescript = true,
      },
      prompt_func_param_type = {
        javascript = true,
        typescript = true,
      },
    },
  },

  -- neotest
  {

    "nvim-neotest/neotest",
    dependencies = {
      -- general tests
      "vim-test/vim-test",
      "nvim-neotest/neotest-vim-test",
      -- language specific tests
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "rouge8/neotest-rust",
      "lawrence-laz/neotest-zig",
      "rcasia/neotest-bash",
    },
    config = function()
      require "custom.configs.neotest"
      require("core.utils").load_mappings "neotest"
    end,
  },
}

return plugins
