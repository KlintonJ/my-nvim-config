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
		build = ":TSUpdate",
		config = function()
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.mips = {
				install_info = {
					url = "https://github.com/omeyenburg/tree-sitter-mips",
					branch = "main",
					files = { "src/parser.c", "src/scanner.c" },
					generate_requires_npm = false,
					requires_generate_from_grammar = false,
				},
			}

			-- Option B (preferred on Neovim ≥0.9): map ft → parser
			vim.treesitter.language.register("mips", { "asm", "vmasm" }) -- use the mips parser for these filetypes

			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				ensure_installed = { -- or run :TSInstall XXXXX
					"mips",
					"python",
					"c", "cpp", "cuda",
					"lua",
					"vim", "vimdoc",
					"query",
					"zig",
				},
					auto_install = false,
				})
		end,
	},

	-- web-devicons
	{
		"nvim-tree/nvim-web-devicons",
	},

	-- ripgrep
	-- {
		-- "BurntSushi/ripgrep",
	-- },

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
