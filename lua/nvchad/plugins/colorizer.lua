return {
  "NvChad/nvim-colorizer.lua",
  event = "User FilePost",
  config = function(_)
    require("colorizer").setup {
      filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "css",
        "html",
        "astro",
        "lua",
        "*",
      },
      user_default_options = {
        names = true,
        rgb_fn = true,
        hsl_fn = true,
        "*",
        tailwind = true,
      },
    }
    -- execute colorizer as soon as possible
    vim.defer_fn(function()
      require("colorizer").attach_to_buffer(0)
    end, 0)
  end,
}
