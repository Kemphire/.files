function Time_in_hour()
	return tonumber(os.date("%H"))
end

return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			require("cyberdream").setup({
				transparent = false,
				italic_comments = true,

				-- Modern borderless telescope theme - also applies to fzf-lua
				borderless_telescope = true,

				-- Set terminal colors used in `:terminal`
				terminal_colors = true,
				cache = true,

				theme = {
					variant = "auto",
					colors = {},
					highlights = {},
				},
				-- Disable or enable colorscheme extensions
				extensions = {
					telescope = true,
					cmp = true,
					lazy = true,
					treesitter = true,
					alpha = true,
					oil = true,
				},
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,

		config = function()
			require("kanagawa").setup({
				transparent = false,
				terminaColors = true,
				commentStyle = { italic = true },
			})
			-- will configure it later
			-- if Time_in_hour() > 7 and Time_in_hour() < 19 then
			-- 	vim.cmd("colorscheme kanagawa-wave")
			-- else
			-- 	vim.cmd("colorscheme kanagawa-dragon")
			-- end
			--
		end,
	},
}
