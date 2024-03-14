local cmp = require "cmp"

require("tailwindcss-colorizer-cmp").setup {
  color_square_width = 2,
}
dofile(vim.g.base46_cache .. "cmp")

local cmp_ui = require("nvconfig").ui.cmp
local cmp_style = cmp_ui.style

local field_arrangement = {
  atom = { "kind", "abbr", "menu" },
  atom_colored = { "kind", "abbr", "menu" },
}

local formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

  format = function(entry, item)
    local icons = require "nvchad.icons.lspkind"
    local icon = (cmp_ui.icons and icons[item.kind]) or ""

    if cmp_style == "atom" or cmp_style == "atom_colored" then
      icon = " " .. icon .. " "
      item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
      item.kind = icon
    else
      icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
      item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
    end
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
    if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
      local words = {}
      for word in string.gmatch(item.word, "[^-]+") do
        table.insert(words, word)
      end

      local color_name, color_number
      if
        words[2] == "x"
        or words[2] == "y"
        or words[2] == "t"
        or words[2] == "b"
        or words[2] == "l"
        or words[2] == "r"
      then
        color_name = words[3]
        color_number = words[4]
      else
        color_name = words[2]
        color_number = words[3]
      end

      if color_name == "white" or color_name == "black" then
        local color
        if color_name == "white" then
          color = "ffffff"
        else
          color = "000000"
        end

        local hl_group = "lsp_documentColor_mf_" .. color
        -- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
        vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })
        item.kind_hl_group = hl_group

        -- make the color square 2 chars wide
        item.kind = string.rep("▣", 1)

        return item
      elseif #words < 3 or #words > 4 then
        -- doesn't look like this is a tailwind css color
        return item
      end

      if not color_name or not color_number then
        return item
      end

      local color_index = tonumber(color_number)
      local tailwindcss_colors = require("tailwindcss-colorizer-cmp.colors").TailwindcssColors

      if not tailwindcss_colors[color_name] then
        return item
      end

      if not tailwindcss_colors[color_name][color_index] then
        return item
      end

      local color = tailwindcss_colors[color_name][color_index]

      local hl_group = "lsp_documentColor_mf_" .. color
      -- vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
      vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "NONE" })

      item.kind_hl_group = hl_group

      -- make the color square 2 chars wide
      item.kind = string.rep("▣", 1)
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

  window = {
    completion = {
      side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
      scrollbar = false,
    },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = formatting_style,

  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
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
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
  options.window.completion.border = border "CmpBorder"
end

return options
