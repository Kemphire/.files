return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	lazy = true,
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				"filename",
				file_status = true,
				path = 1,
			},
		})
	end,
}
