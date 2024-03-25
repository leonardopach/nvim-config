return {
  "mrcjkb/rustaceanvim",
  version = "^3",
  ft = { "rust" },

  config = function()
    vim.g.rustaceanvim = {
      tools = {},
      server = {
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,

        settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              chainingHints = {
                bindingModeHints = {
                  enable = true,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  enable = true,
                  minLines = 25,
                },
                closureCaptureHints = {
                  enable = true,
                },
                closureReturnTypeHints = {
                  enable = "always", -- "never"
                },
                closureStyle = "impl_fn",
                discriminantHints = {
                  enable = "always", -- "never"
                },
                expressionAdjustmentHints = {
                  hideOutsideUnsafe = false,
                  mode = "prefix",
                },
                implicitDrops = {
                  enable = true,
                },
                lifetimeElisionHints = {
                  enable = "always", -- "never"
                  useParameterNames = true,
                },
                maxLength = 25,
                parameterHints = {
                  enable = true,
                },
                rangeExclusiveHints = {
                  enable = true,
                },
                renderColons = {
                  enable = true,
                },
                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false,
                },
              },
            },
            lens = {
              enable = true,
            },
          },
        },
      },
      -- DAP configuration
      -- dap = {},
    }
  end,
}
