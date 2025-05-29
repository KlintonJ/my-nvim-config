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

	-- toppair/peek.nvim
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		ft = { "markdown", "md" },
		config = function()-- default config:
			require('peek').setup({
				auto_load = true,         -- whether to automatically load preview when
				                          -- entering another markdown buffer
				close_on_bdelete = true,  -- close preview window on buffer delete
				syntax = true,            -- enable syntax highlighting, affects performance
				theme = 'dark',           -- 'dark' or 'light'
				update_on_change = true,
				app = 'webview',          -- 'webview', 'browser', string or a table of strings
				filetype = { 'markdown' },-- list of filetypes to recognize as markdown

				-- relevant if update_on_change is true
				throttle_at = 200000,     -- start throttling when file exceeds this
				                          -- amount of bytes in size
				throttle_time = 'auto',   -- minimum amount of time in milliseconds
				                          -- that has to pass before starting new render
			})
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
                        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},

}
