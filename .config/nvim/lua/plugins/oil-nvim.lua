return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("oil").setup({
			columns = {
				"permissions",
				"icon",
			},
			float = {
				padding = 2,
				max_width = 55,
				max_height = 30,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},
			vim.keymap.set({ "v", "n" }, "--", "<CMD>Oil --float<CR>", { desc = "Open parent directory" }),
		})
	end,
}
