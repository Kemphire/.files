return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	event = "VeryLazy",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
	init = function()
		require("ibl").setup()
	end,
}
