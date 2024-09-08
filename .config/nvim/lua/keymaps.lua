local map = vim.keymap.set

-- for inlay hints
map("n", "<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Reveal inlay hints", noremap = true, silent = true })

-- for quitting terminal mode easily
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- for easier motion in bufferline
map(
	{ "n" },
	"<leader>h",
	"<cmd>BufferLineCyclePrev<CR>",
	{ desc = "Go's ahead in bufferline tabs", noremap = true, silent = true }
)
map(
	{ "n" },
	"<leader>l",
	"<cmd>BufferLineCycleNext<CR>",
	{ desc = "swap buffer in backwards direction", noremap = true, silent = true }
)
map(
	{ "n" },
	"<leader>ch",
	"<cmd>BufferLinePick<CR>",
	{ desc = "Toggle picker for bufferlines", noremap = true, silent = true }
)

--- keymaps for Fzf-lua
-- local builtins = require("fzf-lua")
-- map("n", "<leader>ff", builtins.files, { noremap = true, silent = true, desc = "Fzf file searching" })
-- map("n", "<leader>fh", builtins.helptags, { noremap = true, silent = true, desc = "Help tags fzf search" })
-- map("n", "<leader>fg", builtins.live_grep, { noremap = true, silent = true, desc = "Fzf file grepping" })
-- map("n", "<leader>rs", builtins.resume, { noremap = true, silent = true, desc = "Fzf resume command" })
-- map("n", "<leader>fb", builtins.buffers, { noremap = true, silent = true, desc = "Fzf open buffers list" })
-- map("n", "<leader>rg", builtins.registers, { noremap = true, silent = true, desc = "Fzf open show contents" })
-- map("n", "<leader>th", builtins.colorschemes, { noremap = true, silent = true, desc = "Fzf colorschem previewer" })
-- map("n", "<leader>nvc", builtins.commands, { noremap = true, silent = true, desc = "Fzf neovim commands viewer" })
-- map("n", "<leader>mn", builtins.manpages, { noremap = true, silent = true, desc = "Shortucut to view manpages" })
-- map(
-- 	"n",
-- 	"<leader>df",
-- 	builtins.diagnostics_document,
-- 	{ noremap = true, silent = true, desc = "Fzf diagnostics viewer" }
-- )
-- map("n", "<leader>def", builtins.lsp_definitions, { noremap = true, silent = true, desc = "Fzf lsp viewer" })
-- map("n", "<leader>fca", builtins.lsp_code_actions, { noremap = true, silent = true, desc = "Fzf lsp code actions" })
