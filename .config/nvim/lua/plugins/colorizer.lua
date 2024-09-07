return {
	"norcalli/nvim-colorizer.lua",
	version = "*",
	event = "VeryLazy",
	ft = {
		"css",
		"javascript",
		"swayconfig",
		"jsonc",
		"json",
		"conf",
		"lua",
	},
	config = function()
		require("colorizer").setup({
			"css",
			"javascript",
			"swayconfig",
			"jsonc",
			"json",
			"conf",
			"lua",
			html = {
				mode = "foreground",
			},
		})
	end,
}
