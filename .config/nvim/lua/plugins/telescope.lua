-- return {
-- 	"nvim-telescope/telescope.nvim",
-- 	tag = "0.1.6",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	config = function()
-- 		local builtin = require("telescope.builtin")
-- 		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- 		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- 		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
-- 		vim.keymap.set("n", "<leader>rg", builtin.registers, { noremap = true, silent = true })
-- 		-- good practice to ues above args in {} or opts
-- 		vim.keymap.set("n", "<leader>th", ":Telescop colorscheme<CR>", { noremap = true, silent = true })
-- 		vim.keymap.set("n", "<leader>df", builtin.diagnostics, { noremap = true, silent = true })
-- 		vim.keymap.set("n", "<leader>tf", builtin.treesitter, { noremap = true, silent = true })
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
	event = "VimEnter",
	config = function()
		local builtins = require("fzf-lua")
		vim.keymap.set(
			"n",
			"<leader>ff",
			builtins.files,
			{ noremap = true, silent = true, desc = "Fzf file searching" }
		)
		vim.keymap.set(
			"n",
			"<leader>fg",
			builtins.live_grep,
			{ noremap = true, silent = true, desc = "Fzf file grepping" }
		)
		vim.keymap.set(
			"n",
			"<leader>rs",
			builtins.resume,
			{ noremap = true, silent = true, desc = "Fzf resume command" }
		)
		vim.keymap.set(
			"n",
			"<leader>fb",
			builtins.buffers,
			{ noremap = true, silent = true, desc = "Fzf open buffers list" }
		)
		vim.keymap.set(
			"n",
			"<leader>rg",
			builtins.registers,
			{ noremap = true, silent = true, desc = "Fzf open show contents" }
		)
		vim.keymap.set(
			"n",
			"<leader>th",
			builtins.colorschemes,
			{ noremap = true, silent = true, desc = "Fzf colorschem previewer" }
		)
		vim.keymap.set(
			"n",
			"<leader>nvc",
			builtins.commands,
			{ noremap = true, silent = true, desc = "Fzf neovim commands viewer" }
		)
		vim.keymap.set(
			"n",
			"<leader>mn",
			builtins.manpages,
			{ noremap = true, silent = true, desc = "Shortucut to view manpages" }
		)
		vim.keymap.set(
			"n",
			"<leader>df",
			builtins.diagnostics_document,
			{ noremap = true, silent = true, desc = "Fzf diagnostics viewer" }
		)
		vim.keymap.set(
			"n",
			"<leader>def",
			builtins.lsp_definitions,
			{ noremap = true, silent = true, desc = "Fzf lsp viewer" }
		)
		vim.keymap.set(
			"n",
			"<leader>ca",
			builtins.lsp_code_actions,
			{ noremap = true, silent = true, desc = "Fzf lsp code actions" }
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
			{ desc = "sway buffer in backwards direction", noremap = true, silent = true }
		)
		vim.keymap.set(
			{ "n" },
			"<leader>ch",
			"<cmd>BufferLinePick<CR>",
			{ desc = "Toggle picker for bufferlines", noremap = true, silent = true }
		)

		require("fzf-lua").setup({
			winopts = {
				backdrop = 70,
			},
		})
	end,
}
