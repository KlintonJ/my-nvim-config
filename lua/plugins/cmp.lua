-- ~/.config/nvim/lua/plugins/cmp.lua
return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
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
			cmp.setup({
				snippet = { expand = safe_expand },
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, 
				
				{
					{ name = "buffer" },
					{ name = "path"   },
				}),
			})
		end,
	},
}

