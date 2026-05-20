-- ~/.config/nvim/lua/plugins/cmp.lua
return {
	{
		"hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
		config = function()
			-- safe load LuaSnip
			local has_ls, luasnip = pcall(require, "luasnip")
			local function safe_expand(args)
				if not has_ls then
					vim.notify("[LuaSnip] not installed", vim.log.levels.WARN)
					return
				end
				local ok, err = pcall(luasnip.lsp_expand, args.body)
				if not ok then
					vim.notify("[LuaSnip] expand error: " .. err, vim.log.levels.ERROR)
				end
			end

      -- cmp setup
      local cmp = require("cmp")
      local types = require("cmp.types")
      cmp.setup({
        snippet = { expand = safe_expand },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif has_ls and luasnip.expand_or_locally_jumpable and luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_ls and not luasnip.expand_or_locally_jumpable and luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif has_ls and luasnip.locally_jumpable and luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            elseif has_ls and not luasnip.locally_jumpable and luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            entry_filter = function(entry)
              return entry:get_kind() ~= types.lsp.CompletionItemKind.Snippet
            end,
          },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}

