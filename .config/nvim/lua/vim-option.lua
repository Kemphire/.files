vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true
vim.cmd("set path+=**")
vim.cmd("set wildmenu")
vim.opt.ignorecase = true
vim.keymap.set("c", "<tab>", "<C-z>", { silent = false })
vim.cmd("set nohlsearch")

-- vim.cmd("colorscheme default")

-- for obsidian nvim
vim.opt_local.conceallevel = 2

-- shell
vim.opt.shell = "fish"

-- virtual text/line for errors
-- will not work untill shifted to 0.11
vim.diagnostic.config({ virtual_text = true })
