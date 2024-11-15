return {
	{
		"numToStr/Comment.nvim",
		lazy = false,
 		opts = {
			toggler = { line = "co" }, -- normal mode
			opleader = { line = "cao" }, -- visual mode
			extra = { eol = "cel" }, -- add comment to eol

		},
	},

	{
		"folke/todo-comments.nvim",
		opts = {},
	},
}
