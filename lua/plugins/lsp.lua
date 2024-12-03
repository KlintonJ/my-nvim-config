-- lsp config here
return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- for cmp
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			-- for fidget
			"j-hui/fidget.nvim"
		},
		-- configured according to mason-lspconfig guidance
		-- order: fidget -> mason -> mason-lspconfig -> servers started w/ lspconfig -> nvim-cmp
		config = function()
			-- configure fidget here 
			require("fidget").setup({})

			-- configure mason here
			require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
            				package_pending = "➜",
            				package_uninstalled = "✗"
				}
			}})

			-- configure mason-lspconfig here
			require("mason-lspconfig").setup({
				-- servers in use, whether personally configured or not, go here.
				-- exceptions are servers that mason does not have, or if you want
				-- to use a builtin server (clangd).
				ensure_installed = { "zls", "basedpyright", "lua_ls", "clangd" },
				handlers = {
					-- default handler
					function(server_name)
						require("lspconfig")[server_name].setup{}
					end,

					-- servers that you wish to override default settings will go here.
					-- all other in ensure_installed will pass through the default handler.
					-- syntax: [server_name] = function()
						-- require("X_Y_Z").setup({})
					-- end,
					-- "X_Y_Z" here is determined by the lsp server's recommendations/docs
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" }
									}
								}
							}
						})
					end,

					["basedpyright"] = function()
						require("lspconfig").basedpyright.setup({
							settings = {
								basedpyright = {
									analysis = {
										reportMissingSuperCall = false,
									}
								}
							}
						})
					end,
				},
			})

			-- configure cmp here
			local cmp = require('cmp')
			cmp.setup({
			    snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
			      end,
			    },
			    window = {
			      -- completion = cmp.config.window.bordered(),
			      -- documentation = cmp.config.window.bordered(),
			    },
			    mapping = cmp.mapping.preset.insert({
				    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
				    ["<C-f>"] = cmp.mapping.scroll_docs(4),
				    ["<C-Space>"] = cmp.mapping.complete(),
				    ["<C-e>"] = cmp.mapping.abort(),
				    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
				    -- ^^Set `select` to `false` to only confirm explicitly selected items.
			    }),
			    sources = cmp.config.sources({
				    { name = "nvim_lsp" },
				    { name = 'luasnip' }, -- For luasnip users.
			    },
			    {
				    { name = "buffer" },
			    })
		    })

		    vim.diagnostic.config({
			    virtual_text = true,
			    update_in_insert = true,
			    float = {
				    focusable = false,
				    style = "minimal",
				    border = "rounded",
				    source = "always",
				    header = "",
				    prefix = "",
			    },
		    })
	    end,
    },

}
