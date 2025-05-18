-- ~/.config/nvim/lua/plugins/luasnip.lua
return {
	{
		"L3MON4D3/LuaSnip",
		event = { "InsertEnter", "BufReadPost" },
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
