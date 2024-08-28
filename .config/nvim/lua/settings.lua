-- vim.cmd([[colorscheme everforest-nvim]])
vim.cmd("set nohlsearch")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- for popmenu transparency
vim.opt.pumblend = 30

vim.g.loaded_netrwPlugin = false
-- vim.cmd("colorscheme cyberdream")
function LineNumberColors()
	vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#f5ec42', bold = true })
	vim.api.nvim_set_hl(0, 'LineNr', { fg = '#f54245', bold = true })
	vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#f5ec42', bold = true })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		LineNumberColors()
	end
})


