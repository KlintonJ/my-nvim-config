-- for default or low effort config'd plugins
return {
	-- colorscheme
	-- for moonfly (new); nightfox/carbonfox commented for easy swapping
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			-- load here
			vim.cmd [[colorscheme moonfly]]
		end,
	},
	-- {
	--	"EdenEast/nightfox.nvim",
	--	lazy = false,
	--	priority = 1000,
	--	config = function()
	--		-- load here
	--		vim.cmd([[colorscheme carbonfox]])
	--	end,
	-- },
	--
	-- might try brightburn some day?
	-- https://github.com/erikbackman/brightburn.vim

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

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		opts = {
		options = {
			theme = "moonfly"
			-- palenight, nord, moonfly, and nightfly are all nice
		}
	},
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
}
