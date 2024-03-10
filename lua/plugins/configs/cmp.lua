local cmp = require "cmp"
local luasnip = require "luasnip"

dofile(vim.g.base46_cache .. "cmp")

local cmp_ui = require("core.utils").load_config().ui.cmp
local cmp_style = cmp_ui.style

local field_arrangement = {
  atom = { "kind", "abbr", "menu" },
  atom_colored = { "kind", "abbr", "menu" },
}

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

  format = function(entry, item)
    local icons = require "nvchad.icons.lspkind"
    local icon = (cmp_ui.icons and icons[item.kind]) or ""
    item.menu = ({
      nvim_lsp = "",
      nvim_lua = "",
      luasnip = "",
      buffer = "",
      path = "",
      emoji = "",
    })[entry.source.name]

    if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
      local duplicates = {
        buffer = 1,
        path = 1,
        nvim_lsp = 0,
        luasnip = 1,
      }

      local duplicates_default = 0

      item.dup = duplicates[entry.source.name] or duplicates_default
    end

    if entry.source.name == "emoji" then
      item.kind = icons.Smiley
      item.kind_hl_group = "CmpItemKindEmoji"
    end
    if entry.source.name == "crates" then
      item.kind = icons.misc.Package
      item.kind_hl_group = "CmpItemKindCrate"
    end

    if cmp_style == "atom" or cmp_style == "atom_colored" then
      icon = " " .. icon .. " "
      item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
      item.kind = icon
    else
      icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
      item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
    end

    return item
  end,
}

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local options = {
  completion = {
    completeopt = "menu,menuone",
  },

  -- window = {
  --   completion = {
  --     side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
  --     winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
  --     scrollbar = false,
  --   },
  --   documentation = {
  --     border = border "CmpDocBorder",
  --     winhighlight = "Normal:CmpDoc",
  --   },
  -- },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = formatting_style,

  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      elseif check_backspace() then
        fallback()
        require("neotab").tabout()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lua" },
    {
      name = "nvim_lsp",
      entry_filter = function(entry, ctx)
        local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
        if kind == "Snippet" and ctx.prev_context.filetype == "java" then
          return false
        end

        if ctx.prev_context.filetype == "markdown" then
          return true
        end

        if kind == "Text" then
          return false
        end

        return true
      end,
    },
    { name = "buffer" },
    { name = "path" },
    { name = "emoji" },
    { name = "calc" },
    { name = "treesitter" },
    { name = "crates" },
    { name = "tmux" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  view = {
    entries = {
      name = "custom",
      selection_order = "top_down",
    },
    docs = {
      auto_open = true,
    },
  },
  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
      col_offset = -3,
      side_padding = 1,
      scrollbar = false,
      scrolloff = 8,
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
    },
  },
  experimental = {
    ghost_text = false,
  },
}

if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
  options.window.completion.border = border "CmpBorder"
end

return options
