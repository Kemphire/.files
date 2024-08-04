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
vim.keymap.set('c', '<tab>', '<C-z>', { silent = false })
vim.cmd("set nohlsearch")
-- vim.cmd "colorscheme everforest"
