return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		require("colorizer").setup({
			html = {
				mode = "foreground",
			},
			filetypes = {
				"css",
				"javascript",
				"swayconfig",
				"jsonc",
				"json",
				"conf",
				"lua",
			},
			user_default_options = {
				RGB = true,
				RGBA = true,
				RRGGBB = true,
				RRGGBBAA = true,
				AARRGGBB = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
			},
		})
	end,
}
