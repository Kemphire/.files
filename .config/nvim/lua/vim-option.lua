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
-- vim.cmd("colorscheme industry")

-- for increasing timeout limit for null-ls
vim.lsp.buf.format({ timeout_ms = 2000 })


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
