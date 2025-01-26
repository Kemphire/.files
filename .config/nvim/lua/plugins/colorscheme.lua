function Time_in_hour()
	return tonumber(os.date("%H"))
end

return {
	{
		-- "rebelot/kanagawa.nvim",
		-- lazy = false,
		--
		-- config = function()
		-- 	require("kanagawa").setup({
		-- 		transparent = true,
		-- 		terminaColors = true,
		-- 		commentStyle = { italic = true },
		-- 	})
		-- 	-- will configure it later
		-- 	-- if Time_in_hour() > 7 and Time_in_hour() < 19 then
		-- 	-- vim.cmd("colorscheme kanagawa-dragon")
		-- 	-- else
		-- 	-- vim.cmd("colorscheme kanagawa-dragon")
		-- 	-- end
		-- 	--
		-- 	-- vim.cmd("colorscheme kanagawa")
		-- end,
	},
	{
		-- "eldritch-theme/eldritch.nvim",
		-- event = "VeryLazy",
		-- -- priority = 1000,
		-- opts = {
		-- 	transparent = true, -- Enable this to disable setting the background color
		-- 	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
		-- 	styles = {
		-- 		-- Style to be applied to different syntax groups
		-- 		-- Value is any valid attr-list value for `:help nvim_set_hl`
		-- 		comments = { italic = true },
		-- 		keywords = { italic = true },
		-- 		functions = {},
		-- 		variables = {},
		-- 		-- Background styles. Can be "dark", "transparent" or "normal"
		-- 		sidebars = "dark", -- style for sidebars, see below
		-- 		floats = "dark", -- style for floating windows
		-- 	},
		-- 	hide_inactive_statusline = true,
		-- },
		-- init = function()
		-- 	vim.cmd("colorscheme eldritch")
		-- end,
	},
	{
		-- 	"0xstepit/flow.nvim",
		-- 	lazy = false,
		-- 	priority = 1000,
		-- 	tag = "v2.0.1",
		-- 	opts = {
		-- 		theme = {
		-- 			style = "light", --  "dark" | "light"
		-- 			contrast = "default", -- "default" | "high"
		-- 			transparent = true, -- true | false
		-- 		},
		-- 		colors = {
		-- 			mode = "default", -- "default" | "dark" | "light"
		-- 			fluo = "orange", -- "pink" | "cyan" | "yellow" | "orange" | "green"
		-- 			custom = {
		-- 				saturation = "", -- "" | string representing an integer between 0 and 100
		-- 				light = "", -- "" | string representing an integer between 0 and 100
		-- 			},
		-- 		},
		-- 		ui = {
		-- 			borders = "inverse", -- "theme" | "inverse" | "fluo" | "none"
		-- 			aggressive_spell = false, -- true | false
		-- 		},
		-- 	},
		-- 	config = function(_, opts)
		-- 		require("flow").setup(opts)
		-- 		vim.cmd("colorscheme flow")
		-- 	end,
		-- },
	},
	{
		"scottmckendry/cyberdream.nvim",
		-- lazy = false,
		-- event = "VeryLazy",
		-- priority = 1000,
		init = function()
			require("cyberdream").setup({
				transparent = true,
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
					fzflua = true,
					alpha = true,
				},
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},
}
