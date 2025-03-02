function Time_in_hour()
	return tonumber(os.date("%H"))
end

return {
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		tag = "v2.0.1",
		opts = {
			theme = {
				style = "dark", --  "dark" | "light"
				contrast = "default", -- "default" | "high"
				transparent = true, -- true | false
			},
			colors = {
				mode = "default", -- "default" | "dark" | "light"
				fluo = "orange", -- "pink" | "cyan" | "yellow" | "orange" | "green"
				custom = {
					saturation = "", -- "" | string representing an integer between 0 and 100
					light = "", -- "" | string representing an integer between 0 and 100
				},
			},
			ui = {
				borders = "theme", -- "theme" | "inverse" | "fluo" | "none"
				aggressive_spell = true, -- true | false
			},
		},
		config = function(_, opts)
			require("flow").setup(opts)
			vim.cmd("colorscheme flow")
		end,
	},

	-- Uncomment and configure themes as needed
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			transparent = true,
	-- 			terminaColors = true,
	-- 			commentStyle = { italic = true },
	-- 		})
	-- 		vim.cmd("colorscheme kanagawa")
	-- 	end,
	-- },

	-- {
	-- 	"eldritch-theme/eldritch.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		transparent = true,
	-- 		terminal_colors = true,
	-- 		styles = {
	-- 			comments = { italic = true },
	-- 			keywords = { italic = true },
	-- 			sidebars = "dark",
	-- 			floats = "dark",
	-- 		},
	-- 		hide_inactive_statusline = true,
	-- 	},
	-- 	init = function()
	-- 		vim.cmd("colorscheme eldritch")
	-- 	end,
	-- },

	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	init = function()
	-- 		require("cyberdream").setup({
	-- 			variant = "auto",
	-- 			transparent = true,
	-- 			saturation = 0.7,
	-- 			italic_comments = true,
	-- 			hide_fillchars = true,
	-- 			borderless_pickers = true,
	-- 			terminal_colors = true,
	-- 			cache = true,
	-- 			highlights = {
	-- 				Comment = { fg = "#696969", bg = "NONE", italic = true },
	-- 			},
	-- 			overrides = function(colors)
	-- 				return {
	-- 					Comment = { fg = colors.green, bg = "NONE", italic = true },
	-- 					["@property"] = { fg = colors.magenta, bold = true },
	-- 				}
	-- 			end,
	-- 			colors = {
	-- 				bg = "#000000",
	-- 				green = "#00ff00",
	-- 				magenta = "#ff00ff",
	-- 			},
	-- 			extensions = {
	-- 				telescope = true,
	-- 				notify = true,
	-- 				mini = true,
	-- 				lazy = true,
	-- 				dashboard = true,
	-- 				snacks = true,
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme cyberdream")
	-- 	end,
	-- },

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	init = function()
	-- 		vim.cmd("colorscheme tokyonight-night")
	-- 	end,
	-- },
}
