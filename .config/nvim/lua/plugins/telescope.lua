return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>rg", builtin.registers, { noremap = true, silent = true })
		-- good practice to ues above args in {} or opts
		vim.keymap.set("n","<leader>th",":Telescop colorscheme<CR>",{noremap = true, silent = true})
		vim.keymap.set("n","<leader>df",builtin.diagnostics,{noremap = true, silent = true})
		vim.keymap.set("n","<leader>tf",builtin.treesitter,{noremap = true, silent = true})
		require("telescope").setup({
			pickers = {
				find_files = {
					theme = "dropdown",
				}
			}
		})
	end,
}
