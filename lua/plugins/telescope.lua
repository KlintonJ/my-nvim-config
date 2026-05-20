return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    },
    opts = {},
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      pcall(telescope.load_extension, "fzy_native")
    end,
    keys = {
      {
        "<leader>pf",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files in current working dir.",
      },
      {
        "<leader>lg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({
            search = vim.fn.input("Grep > "),
          })
        end,
        desc = "Find string under cursor / in selection",
      },
      {
        "<leader>sb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Show buffers",
      },
    },
  },
}
