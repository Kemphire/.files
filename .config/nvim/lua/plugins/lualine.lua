return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	-- lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox",
				"filename",
				file_status = true,
				path = 1,
				icons_enabled = true,
			},
		})
	end,
	-- "echasnovski/mini.statusline",
	-- version = false,
	-- event = "VeryLazy",
	-- init = function()
	-- 	require("mini.statusline").setup({
	-- 		-- Whether to use icons by default
	-- 		use_icons = true,
	--
	-- 		-- Whether to set Vim's settings for statusline (make it always shown)
	-- 		set_vim_settings = true,
	-- 	})
	-- end,
}
