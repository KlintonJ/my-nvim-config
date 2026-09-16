return {
	{
		"folke/trouble.nvim",
		opts = { use_lsp_diagnostics = true },
		cmd = "Trouble",
		keys =
		{
			{
				"<leader>tw",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Toggle Trouble Diagnostics"
			},

			{
				"<leader>dn",
                                function() require("trouble").next({skip_groups = true, jump = true}) end,
				desc = "Project-wide diagnostics jump (next)",
                                mode = "n"
			},

			{
				"<leader>dp",
                                function() require("trouble").previous({skip_groups = true, jump = true}) end,
				desc = "Project-wide diagnostics jump (prev)",
                                mode = "n"
			},

			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Toggle Trouble Symbols"
			},

			{
				"<leader>qf",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Toggle Trouble Quickfix list"
			},

      {
        "<leader>refs",
        "<cmd>Trouble lsp_references toggle focus=true<cr>",
        desc = "Trouble LSP references list"
      },
		},
	},
}
