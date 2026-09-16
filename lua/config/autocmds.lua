local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local MyAutoCmds = augroup("MyAutoCmds", {})

local function apply_custom_highlights()
  -- flexoki custom dark / inky semantic colors
  local keyword = "#6c201c" -- flexoki red-800
  local type_col = "#24837b" -- flexoki cyan-600
  local func = "#9d4310" -- flexoki orange-700
  local string = "#66800b" -- flexoki green-600
  local comment = "#878580" -- warm muted text 
  local foreground = "#cecdc3" -- main foreground
  local member = "#9f9d96" -- flexoki base-400
  local punctuation = "#878580"
  local builtin = "#5e409d" -- flexoki purple-600

  local search_fg = "#CECDC3"
  local search_bg = "#34264B"
  local inc_cur_search_fg = "#FFFCF0"
  local inc_cur_search_bg = "#4F3685"

  local cursorline = "#100f0f"
  local colorcolumn = "#1c1b1a"
  local line_nr = "#575653"

  -- classic vim syntax groups followed by tree-sitter highlight captures 

  -- keywords
  vim.api.nvim_set_hl(0, "Keyword", { fg = keyword })
  vim.api.nvim_set_hl(0, "Statement", { fg = keyword })
  vim.api.nvim_set_hl(0, "Conditional", { fg = keyword })
  vim.api.nvim_set_hl(0, "Repeat", { fg = keyword })
  vim.api.nvim_set_hl(0, "Exception", { fg = keyword })

  vim.api.nvim_set_hl(0, "@keyword", { fg = keyword })
  vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = keyword })
  vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = keyword })
  vim.api.nvim_set_hl(0, "@keyword.return", { fg = keyword })
  vim.api.nvim_set_hl(0, "@keyword.import", { fg = keyword })
  vim.api.nvim_set_hl(0, "@keyword.function", { fg = keyword })
  vim.api.nvim_set_hl(0, "@keyword.operator", { fg = keyword })

  -- types
  vim.api.nvim_set_hl(0, "Type", { fg = type_col })
  vim.api.nvim_set_hl(0, "Structure", { fg = type_col })
  vim.api.nvim_set_hl(0, "Typedef", { fg = type_col })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = type_col })

  vim.api.nvim_set_hl(0, "@type", { fg = type_col })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = type_col })
  vim.api.nvim_set_hl(0, "@type.definition", { fg = type_col })
  vim.api.nvim_set_hl(0, "@type.qualifier", { fg = type_col })

  -- functions
  vim.api.nvim_set_hl(0, "Function", { fg = func })

  vim.api.nvim_set_hl(0, "@function", { fg = func })
  vim.api.nvim_set_hl(0, "@function.call", { fg = func })
  vim.api.nvim_set_hl(0, "@function.method", { fg = func })
  vim.api.nvim_set_hl(0, "@function.method.call", { fg = func })
  vim.api.nvim_set_hl(0, "@method", { fg = func })
  vim.api.nvim_set_hl(0, "@method.call", { fg = func })
  vim.api.nvim_set_hl(0, "@constructor", { fg = func })

  -- builtins
  vim.api.nvim_set_hl(0, "@function.builtin", { fg = builtin })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = builtin })


  -- strings
  vim.api.nvim_set_hl(0, "String", { fg = string })

  vim.api.nvim_set_hl(0, "@string", { fg = string })

  -- comments
  vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

  vim.api.nvim_set_hl(0, "@comment", { fg = comment, italic = true })

  -- variables
  vim.api.nvim_set_hl(0, "@variable", { fg = foreground })
  vim.api.nvim_set_hl(0, "@variable.member", { fg = member })
  vim.api.nvim_set_hl(0, "@property", { fg = member })
  vim.api.nvim_set_hl(0, "@field", { fg = member })

  -- punctuation
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = punctuation })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = punctuation })

  -- search 
  vim.api.nvim_set_hl(0, "Search", { fg = search_fg, bg = search_bg })
  vim.api.nvim_set_hl(0, "IncSearch", { fg = inc_cur_search_fg, bg = inc_cur_search_bg })
  vim.api.nvim_set_hl(0, "CurSearch", { fg = inc_cur_search_fg, bg = inc_cur_search_bg })


  -- UI polish
  vim.api.nvim_set_hl(0, "LineNr", { fg = line_nr })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = foreground, bold = true })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = cursorline })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = colorcolumn })
end

autocmd("ColorScheme", {
  group = MyAutoCmds,
  pattern = "*",
  callback = apply_custom_highlights,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = MyAutoCmds,
  pattern = "*",
  callback = function(e)
    local client = vim.lsp.get_client_by_id(e.data.client_id)

    -- Let Tree-sitter handle Zig highlighting.
    -- ZLS sometimes labels function calls as variables, which overrides @function.call.
    if client and client.name == "zls" then
      client.server_capabilities.semanticTokensProvider = nil
    end

    vim.schedule(apply_custom_highlights)
  end,
})

-- apply once in case this file is sourced after the colorscheme is already active 
apply_custom_highlights()
