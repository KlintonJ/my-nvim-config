-- mykeybinds

-- NOTE: most plugin-specific keybindings can
-- be found in the keys portion of their config.

-- leader
vim.g.mapleader = " "

local vk = vim.keymap

-- window navigation
vk.set("n", "<leader>sl", ":vsplit<CR>", { desc = "Vertical Split" })
vk.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal Split" })
vk.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vk.set("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom window" })
vk.set("n", "<leader>wk", "<C-w>k", { desc = "Move to top window" })
vk.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })

-- buffer navigation
vk.set("n", "<leader>bn", ":bnext<CR>", { desc = "Go to next buffer" })
vk.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Go to prev buffer" })
vk.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- save and quit
vk.set("n", "<leader>as", ":wa<CR>", { desc = "Save all files" })
vk.set("n", "<leader>xa", ":qa<CR>", { desc = "Quit all files" })

-- TODO: add some netrw mappings

