return {
	"m4xshen/autoclose.nvim",
	event = "VeryLazy",
	config = function()
		require("autoclose").setup({
			disable = {},
			ignored_next_char = "[%w%.]", -- will not autoclose when next character is alphanumeric or dot
			ignored_filetypes = {},
			filetypes = {
				"lua",
				"c",
				"cpp",
				"rust",
				"python",
				"javascript",
				"typescript",
				"html",
				"htmldjango",
				"css",
				"json",
				"yaml",
				"toml",
				"vim",
				"jinja",
			},
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {"htmldjango", "html"},
			callback = function()
				require("autoclose").setup({
					keys = {
						["%"] = { escape = true, close = true, pair = "%%", disabled_filetypes = {} },
					},
				})
			end,
		})
	end,
}
