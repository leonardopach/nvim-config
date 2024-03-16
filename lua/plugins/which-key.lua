return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup()
    -- Document existing key chains
    require("which-key").register {
      ["<leader>a"] = { name = "[T]abs", _ = "which_key_ignore" },
      ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
      ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
      ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
      ["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
      ["<leader>l"] = { name = "[L]spsaga/[T]odo", _ = "which_key_ignore" },
      ["<leader>p"] = { name = "[E]x", _ = "which_key_ignore" },
      ["<leader>o"] = { name = "[N]avbuddy", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
      ["<leader>t"] = { name = "[T]esting", _ = "which_key_ignore" },
      ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
      ["<leader>u"] = { name = "[I]nlayHints", _ = "which_key_ignore" },
      ["<leader>z"] = { name = "[Z]enmode", _ = "which_key_ignore" },
    }
  end,
}
