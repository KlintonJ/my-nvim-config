return {
	{
		"danymat/neogen",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("neogen").setup({
				snippet_engine = "luasnip",
			})
			vim.keymap.set("n", "<leader>gf", function()
				require("neogen").generate({ type = "func" })
			end)
			vim.keymap.set("n", "<leader>gt", function()
				require("neogen").generate({ type = "type" })
			end)
			vim.keymap.set("n", "<leader>gl", function()
				require("neogen").generate({ type = "type" })
			end)
		end,
	},
}
