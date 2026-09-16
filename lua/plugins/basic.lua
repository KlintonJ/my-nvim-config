-- for default or low effort config'd plugins
return {
	-- colorscheme
	-- for moonfly (new); nightfox/carbonfox commented for easy swapping
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	-- 	name = "moonfly",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- load here
	-- 		vim.cmd [[colorscheme moonfly]]
 --  	end,
 --  },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- load here
  --     vim.cmd([[colorscheme carbonfox]])
  --   end,
  -- },
  -- an inky theme (its great and has huge customizability)
  {
    "kepano/flexoki-neovim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("flexoki")
    end
  },
	-- might try some day:
  -- brightburn
	-- https://github.com/erikbackman/brightburn.vim
  -- material.nvim
  -- https://github.com/marko-cerovac/material.nvim
  -- rosepine
  -- https://github.com/rose-pine/neovim
  -- citruszest
  -- https://github.com/zootedb0t/citruszest.nvim
  -- tokyonight
  -- https://github.com/folke/tokyonight.nvim
  -- cyberdream
  -- https://github.com/scottmckendry/cyberdream.nvim

	-- plenary
	{
		"nvim-lua/plenary.nvim",
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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local theme = require("lualine.themes.auto")
      -- Only override the INSERT mode block
      theme.insert.a = {
        fg = "#fffcf0", -- warm light text
        bg = "#536907", -- dark inky green
        gui = "bold",
      }
      return {
        options = {
          theme = theme,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            {
              "diff",
              colored = true,
              -- symbols not changed
              diff_color = {
                added = { fg = "#66800b" }, -- flexoki green-600
                modified = { fg = "#ad8301" }, -- flexoki yellow-600
                removed = { fg = "#af3029" }, -- flexoki red-600
              },
            },
            "diagnostics",
          },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
}
