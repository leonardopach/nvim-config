return {
  "kawre/neotab.nvim",
  event = "InsertEnter",
  config = function()
    require("neotab").setup {
      tabkey = "<Tab>",
      act_as_tab = true, -- fallback to tab, if `tabout` action is not available
      behavior = "nested",
      pairs = {
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "<", close = ">" },
      },
      exclude = {},
      smart_punctuators = {
        enabled = true,
        semicolon = {
          enabled = true,
          ft = { "cs", "c", "cpp", "java", "javascript" },
        },
        escape = {
          enabled = true,
          triggers = {},
        },
      },
    }
  end,
}
