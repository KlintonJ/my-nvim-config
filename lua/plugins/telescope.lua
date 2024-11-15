return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false, -- don't lazy load
		version = "*",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"nvim-telescope/telescope-fzy-native.nvim"
		},
		config = function()
			require("telescope").setup({})
			require("config.mappings")
		end,
		-- keybindings
		keys = {
			{
				"<leader>pf", function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files in current working dir."
			},
			{
				"<leader>lg", function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep"
			},
			{
				"<leader>ps", function()
					require("telescope.builtin").grep_string(
					{ search = vim.fn.input("Grep > ") })
				end,
				desc = "Find string under cursor / in selection"
			},
			{
				"<leader>sb", function()
					require("telescope.builtin").buffers()
				end,
				desc = "Show buffers"
			},
		},
	},
}
