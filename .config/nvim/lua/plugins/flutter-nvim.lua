return {
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		ft = "dart",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			-- require("flutter-tools").setup({
			-- 	lsp = {
			-- 		color = {
			-- 			enabled = true,
			-- 			background = true,
			-- 			foreground = true,
			-- 		},
			-- 	},
			-- }) -- use defaults
		end,
	},
	{
		"wa11breaker/flutter-bloc.nvim",
		ft = "dart",
		dependencies = {
			"nvimtools/none-ls.nvim", -- Required for code actions
		},
		opts = {
			bloc_type = "default", -- Choose from: 'default', 'equatable', 'freezed'
			use_sealed_classes = false,
			enable_code_actions = true,
		},
		config = function()
			require("flutter-bloc").setup()
		end,
	},
}
