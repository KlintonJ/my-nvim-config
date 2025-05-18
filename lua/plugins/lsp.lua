-- ~/.config/nvim/lua/plugins/lsp.lua
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "zls", "lua_ls", "basedpyright" },
				handlers = {
					-- per‑server overrides
					lua_ls = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								Lua = { diagnostics = { globals = { "vim" } } },
							},
						})
					end,
					basedpyright = function()
						require("lspconfig").basedpyright.setup({
							settings = {
								basedpyright = { analysis = { reportMissingSuperCall = false } },
							},
						})
					end,
					-- default handler for other servers
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})

			-- global diagnostic config
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

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
		-- no extra config here, since mason‑lspconfig’s handlers set up each server
	},
}

