return {
	"norcalli/nvim-colorizer.lua",
	version = "*",
	event = "VeryLazy",
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
