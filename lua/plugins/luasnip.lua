-- ~/.config/nvim/lua/plugins/luasnip.lua
return {
  {
    "L3MON4D3/LuaSnip",
    event = { "InsertEnter", "BufReadPost" },
    config = function()
      require("luasnip").setup({})
    end,
  },
}
