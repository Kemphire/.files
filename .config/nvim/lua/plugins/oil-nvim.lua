-- return {
-- 	"stevearc/oil.nvim",
-- 	event = "VimEnter",
-- 	lazy = true,
-- 	opts = {},
-- 	-- Optional dependencies
-- 	dependencies = { "echasnovski/mini.icons" },
-- 	config = function()
-- 		require("oil").setup({
-- 			columns = {
-- 				"icon",
-- 			},
-- 			preview = {
-- 				win_options = {
-- 					winblend = 1,
-- 				}
-- 			},
-- 			float = {
-- 				padding = 2,
-- 				max_width = 55,
-- 				max_height = 30,
-- 				border = "rounded",
-- 				win_options = {
-- 					winblend = 1,
-- 				},
-- 			},
-- 			vim.keymap.set({ "v", "n" }, "--", "<CMD>Oil --float<CR>", { desc = "Open parent directory" }),
-- 		})
-- 	end,
-- }
---@type LazySpec
return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>-",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<C-e>",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				-- NOTE: this requires a version of yazi that includes
				-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
			yazi_floating_window_winblend = 25,
			floating_window_scaling_factor = 0.6,
		},
	},
}
