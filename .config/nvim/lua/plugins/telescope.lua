local map = vim.keymap.set
-- return {
-- 	"nvim-telescope/telescope.nvim",
-- 	tag = "0.1.6",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	config = function()
-- 		local builtin = require("telescope.builtin")
-- 		map("n", "<leader>ff", builtin.find_files, {})
-- 		map("n", "<leader>fg", builtin.live_grep, {})
-- 		map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
-- 		map("n", "<leader>rg", builtin.registers, { noremap = true, silent = true })
-- 		-- good practice to ues above args in {} or opts
-- 		map("n", "<leader>th", ":Telescop colorscheme<CR>", { noremap = true, silent = true })
-- 		map("n", "<leader>df", builtin.diagnostics, { noremap = true, silent = true })
-- 		map("n", "<leader>tf", builtin.treesitter, { noremap = true, silent = true })
-- 		require("telescope").setup({
-- 			pickers = {
-- 				find_files = {
-- 			-- 		theme = "dropdown",
-- 					hidden = false,
-- 				}
-- 			},
-- 			defaults = {
-- 				prompt_prefix = "🔍  ",
-- 				selection_caret = " ",
-- 				winblend = 40,
-- 				mappings = {
-- 					i = {
-- 						["<C-n>"] = require("telescope.actions").move_selection_next,
-- 						["<C-p>"] = require("telescope.actions").move_selection_previous,
-- 					},
-- 					n = {
-- 						["<C-n>"] = require("telescope.actions").move_selection_next,
-- 						["<C-p>"] = require("telescope.actions").move_selection_previous,
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- }

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local builtins = require("fzf-lua")
		map("n", "<leader>ff", builtins.files, { noremap = true, silent = true, desc = "Fzf file searching" })
		map("n", "<leader>fh", builtins.helptags, { noremap = true, silent = true, desc = "Help tags fzf search" })
		map("n", "<leader>fg", builtins.live_grep, { noremap = true, silent = true, desc = "Fzf file grepping" })
		map("n", "<leader>rs", builtins.resume, { noremap = true, silent = true, desc = "Fzf resume command" })
		map("n", "<leader>fb", builtins.buffers, { noremap = true, silent = true, desc = "Fzf open buffers list" })
		map("n", "<leader>rg", builtins.registers, { noremap = true, silent = true, desc = "Fzf open show contents" })
		map(
			"n",
			"<leader>th",
			builtins.colorschemes,
			{ noremap = true, silent = true, desc = "Fzf colorschem previewer" }
		)
		map(
			"n",
			"<leader>nvc",
			builtins.commands,
			{ noremap = true, silent = true, desc = "Fzf neovim commands viewer" }
		)
		map(
			"n",
			"<leader>mn",
			builtins.manpages,
			{ noremap = true, silent = true, desc = "Shortucut to view manpages" }
		)
		map(
			"n",
			"<leader>df",
			builtins.diagnostics_document,
			{ noremap = true, silent = true, desc = "Fzf diagnostics viewer" }
		)
		map("n", "<leader>def", builtins.lsp_definitions, { noremap = true, silent = true, desc = "Fzf lsp viewer" })
		map(
			"n",
			"<leader>fca",
			builtins.lsp_code_actions,
			{ noremap = true, silent = true, desc = "Fzf lsp code actions" }
		)

		require("fzf-lua").setup({
			winopts = {
				backdrop = 70,
			},
			fzf_colors = true,
			defaults = {
				file_icons = false,
			},
		})
	end,
}
