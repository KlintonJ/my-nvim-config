local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local MyAutoCmds = augroup("MyAutoCmds", {})

autocmd("LspAttach", {
	group = MyAutoCmds,
	callback = function(e)
		local opts = { buffer = ev.buf }
		local function attach(opts)
			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
			vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
			vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
			vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
			vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.signature_help() end, opts)
		end
	end
})
