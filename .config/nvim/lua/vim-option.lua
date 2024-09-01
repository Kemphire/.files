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
vim.cmd("colorscheme vim")

-- for easier motion in bufferline
vim.keymap.set(
	{ "n" },
	"<leader>h",
	"<cmd>BufferLineCyclePrev<CR>",
	{ desc = "Go's ahead in bufferline tabs", noremap = true, silent = true }
)
vim.keymap.set(
	{ "n" },
	"<leader>l",
	"<cmd>BufferLineCycleNext<CR>",
	{ desc = "swap buffer in backwards direction", noremap = true, silent = true }
)
vim.keymap.set(
	{ "n" },
	"<leader>ch",
	"<cmd>BufferLinePick<CR>",
	{ desc = "Toggle picker for bufferlines", noremap = true, silent = true }
)

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

-- to check if a file exist or not
function file_exists(filename)
	local file = io.open(filename, "r")
	if file then
		file:close()
		return true
	else
		return false
	end
end

--  if there is a sesssion.vim file containig session load if
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Add a delay of 500ms before sourcing the session.vim
		vim.defer_fn(function()
			if file_exists("session.vim") then
				vim.cmd("source session.vim")
			end
		end, 500) -- Delay in milliseconds
	end,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		if file_exists("session.vim") then
			vim.cmd("mksession! session.vim")
		end
	end,
})
