-- https://luals.github.io/wiki/settings/
return {
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      runtime = {
        version = "LuaJIT",
      },
      completion = {
        workspaceWord = true,
        callSnippet = "Both",
      },
      misc = {
        parameters = {
          -- "--log-level=trace",
        },
      },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        -- paramName = "Disable",
        -- semicolon = "Disable",
        -- arrayIndex = "Disable",
      },
      doc = {
        privateName = { "^_" },
      },
      type = {
        castNumberToInteger = true,
      },
      diagnostics = {
        disable = { "incomplete-signature-doc", "trailing-space" },
        -- enable = false,
        groupSeverity = {
          strong = "Warning",
          strict = "Warning",
        },
        globals = { "vim" },
        groupFileStatus = {
          ["ambiguity"] = "Opened",
          ["await"] = "Opened",
          ["codestyle"] = "None",
          ["duplicate"] = "Opened",
          ["global"] = "Opened",
          ["luadoc"] = "Opened",
          ["redefined"] = "Opened",
          ["strict"] = "Opened",
          ["strong"] = "Opened",
          ["type-check"] = "Opened",
          ["unbalanced"] = "Opened",
          ["unused"] = "Opened",
        },
        unusedLocalExclude = { "_*" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          -- "${3rd}/luv/library",
          -- unpack(vim.api.nvim_get_runtime_file("", true)),
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
