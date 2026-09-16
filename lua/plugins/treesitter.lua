-- treesitter
-- ~/.config/nvim/lua/plugins/treesitter.lua

local parsers = {
  "c",
  "cpp",
  "cuda",
  "lua",
  "python",
  "query",
  "vim",
  "vimdoc",
  "zig",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "c",
          "cpp",
          "cuda",
          "lua",
          "python",
          "query",
          "vim",
          "vimdoc",
          "zig",
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
