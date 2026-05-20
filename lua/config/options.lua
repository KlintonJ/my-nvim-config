-- default indentation: 4 spaces
vim.opt.expandtab = true -- tabs will now insert spaces
vim.opt.tabstop = 4 -- tabs now count for 4 spaces 
vim.opt.shiftwidth = 4 -- << and >> and autoindent width 
vim.opt.softtabstop = 4 -- spaces inserted for <Tab> in insert mode


-- sane exceptions to tab=spaces 
local function set_indent(opts)
	vim.bo.expandtab = opts.et
	vim.bo.tabstop = opts.ts
	vim.bo.shiftwidth = opts.sw
	vim.bo.softtabstop = opts.sts
end

local grp = vim.api.nvim_create_augroup("IndentationOverrides", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = { "make" }, -- Makefiles 
	callback = function()
		-- recipe lines will require real tabs 
		-- keeps traditional tabs but does not expand them to spaces 
		set_indent({ et = false, ts = 8, sw = 8, sts = 0 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = {"json", "toml", "xml" },
	callback = function()
		-- 2 spaces for data/config formats 
		set_indent({ et = true, ts = 2, sw = 2, sts = 2 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = { "xaml" },
	callback = function()
		-- XAML w/ C# usually want 4 spaces
		set_indent({ et = true, ts = 4, sw = 4, sts = 4 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = { "c", "cpp", "cs", "python" },
	callback = function()
		-- 4 spaces for C/C++/C#/Python
		set_indent({ et = true, ts = 4, sw = 4, sts = 4 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = { "sh", "bash", "zsh" },
	callback = function()
		-- 4 spaces for shell scripts
		set_indent({ et = true, ts = 4, sw = 4, sts = 4 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = { "zig", "zon" },
	callback = function()
		-- 4 spaces for Zig/Zon
		set_indent({ et = true, ts = 4, sw = 4, sts = 4 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = grp,
	pattern = {"lua" },
	callback = function()
		-- 2 spaces for lua 
		set_indent({ et = true, ts = 2, sw = 2, sts = 2 })
	end,
})

