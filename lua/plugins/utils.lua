-- utility functions
return {
	-- startuptime
	{
		"dstein64/vim-startuptime",
		-- lazy load on cmd
		cmd = "StartupTime",
		-- init is called during startup.
		-- config for vim plugins generally
		-- should be set in an init func.
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- Wansmer/treesj split/join code blocks
	{
		"Wansmer/treesj",
		keys = { { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" } },
		opts = { use_default_keymaps = false, max_join_length = 150 },
	},

	-- folke/which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({
						global = false,
						keys = "<c-w>",
						loop = true,
					})
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

}
