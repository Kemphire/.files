return {
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		ft = "dart",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		opts = {},
		config = function()
			require("flutter-tools").setup({
				lsp = {
					color = {
						enabled = true,
						background = true,
						foreground = true,
					},
				},
				fvm = true,
				widget_guides = {
					enabled = false,
				},
			}) -- use defaults
		end,
	},
}
