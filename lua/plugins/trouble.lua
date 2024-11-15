return {
	{
		"folke/trouble.nvim",
		opts = { use_lsp_diagnostics = true },
		cmd = "Trouble",
		keys = 
		{
			{
				"<leader>ts",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Toggle Trouble Diagnostics"
			},

			{
				"n", "<leader>dn", function()
					require("trouble").next({skip_groups = true, jump = true})
				end,
				desc = "Project-wide diagnostics jump (next)"
			},

			{
				"n", "<leader>dp", function()
					require("trouble").previous({skip_groups = true, jump = true})
				end,
				desc = "Project-wide diagnostics jump (prev)"
			},

			{
				"<leader>tw",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Toggle Trouble Symbols"
			},

			{
				"<leader>qf",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Toggle Trouble Quickfix list"
			},

		},
	},
}
