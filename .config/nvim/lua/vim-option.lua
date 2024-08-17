vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.g.mapleader = " "

-- for quitting terminal mode easily
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true
vim.cmd("set path+=**")
vim.cmd("set wildmenu")
vim.opt.ignorecase = true
vim.keymap.set("c", "<tab>", "<C-z>", { silent = false })
vim.cmd("set nohlsearch")
-- vim.cmd "colorscheme everforest"

-- for persistent code folding
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})
