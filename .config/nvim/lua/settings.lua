-- vim.cmd([[colorscheme everforest-nvim]])
vim.cmd("set nohlsearch")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- for popmenu transparency
vim.opt.pumblend=30

vim.g.loaded_netrwPlugin = false
-- vim.cmd("colorscheme cyberdream")
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#FB508F', bold=true })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='red', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end

LineNumberColors()
