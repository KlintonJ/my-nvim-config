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
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
		opts = {
      merge_keywords = false,
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
        TODO = { icon = " ", color = "todo" },
        HACK = { icon = " ", color = "hack" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" }, },
        PERF = { icon = "󰓅 ", color = "perf", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" }, },
        NOTE = { icon = " ", color = "note", alt = { "INFO" } },
        TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        QUESTION = { icon = " ", color = "question", alt = { "QUEST" }, },
        ALTOPTION = { icon = " ", color = "altoption", alt = { "ALTOPTIONS", "ALT" }, },
      },
      colors = {
        error = { "#942822" }, -- flexoki red-700
        todo = { "#1a4f8c" }, -- flexoki blue-700
        -- info = { "#80a0ff" },
        hack = { "#9d4310" }, -- flexoki orange-700
        warning = { "#8e6b01" }, -- flexoki yellow-700
        perf = { "#536907" }, -- flexoki green-700
        note = { "#1c6c66" }, -- flexoki cyan-700
        -- default = { "#7C3AED" },
        test = { "#87285e" }, -- flexoki magenta-700
        question = { "#71320d" }, -- flexoki orange-800
        altoption = { "#4f3685" }, -- flexoki purple-700
      },
      highlight = {
        before = "",
        keyword = "wide_fg",
        after = "fg",
      },
    },
	},
}
-- tests:
-- FIX: 
-- FIXME:
-- BUG: 
-- FIXIT:
-- ISSUE:
-- TODO:
-- HACK:
-- WARN:
-- WARNING:
-- XXX:
-- PERF:
-- OPTIM:
-- PERFORMANCE:
-- OPTIMIZE:
-- NOTE:
-- INFO:
-- TEST:
-- TESTING:
-- PASSED:
-- FAILED:
-- QUESTION:
-- QUEST:
-- ALTOPTION:
-- ALTOPTIONS:
-- ALT: 
