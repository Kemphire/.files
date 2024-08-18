return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
				"filename",
				file_status = true,
				path = 1,
			},
		})
	end,
}
