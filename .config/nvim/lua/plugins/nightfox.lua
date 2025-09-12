function Time_in_hour()
	return tonumber(os.date("%H"))
end

-- local current_time = Time_in_hour()

return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 100,

	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
			},
		})

		vim.cmd("colorscheme terafox")
	end,
}
