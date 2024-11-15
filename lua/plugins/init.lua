-- for default or low effort config'd plugins
return {
	-- colorscheme
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- load here
			vim.cmd([[colorscheme carbonfox]])
		end,
	},

	-- plenary
	{
		"nvim-lua/plenary.nvim",
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
	},

	-- web-devicons
	{
		"nvim-tree/nvim-web-devicons",
	},

	-- ripgrep
	{
		"BurntSushi/ripgrep",
	},

	-- telescope-fzy-native
	{
		"nvim-telescope/telescope-fzy-native.nvim"
	},

	-- fd (alt to find)
	{
		dir = "/opt/homebrew/bin/fd"
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		opts = {
		options = {
			theme = "palenight"
			-- palenight, nord, moonfly, and nightfly are all nice
		}
	},
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
}
