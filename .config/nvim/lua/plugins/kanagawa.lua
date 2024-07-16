function Time_in_hour()
	return tonumber(os.date("%H"))
end

return {
	"rebelot/kanagawa.nvim",
	lazy = false,

	config = function()
	require("kanagawa").setup({
			transparent = false,
			terminaColors = true,
			commentStyle = { italic = true },
		})
		if Time_in_hour() > 7 and Time_in_hour() < 19 then
			vim.cmd("colorscheme kanagawa-wave")
		else
			vim.cmd("colorscheme kanagawa-dragon")
		end

	end,
}
