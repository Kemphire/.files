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
				variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

				-- Enable transparent background
				transparent = true,

				-- Reduce the overall saturation of colours for a more muted look
				saturation = 0.7, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

				-- Enable italics comments
				italic_comments = true,

				-- Replace all fillchars with ' ' for the ultimate clean look
				hide_fillchars = true,

				-- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
				borderless_pickers = true,

				-- Set terminal colors used in `:terminal`
				terminal_colors = true,

				-- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
				cache = true,
				-- Override highlight groups with your own colour values
				highlights = {
					-- Highlight groups to override, adding new groups is also possible
					-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

					-- Example:
					Comment = { fg = "#696969", bg = "NONE", italic = true },

					-- More examples can be found in `lua/cyberdream/extensions/*.lua`
				},

				-- Override a highlight group entirely using the built-in colour palette
				overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
					-- Example:
					return {
						Comment = { fg = colors.green, bg = "NONE", italic = true },
						["@property"] = { fg = colors.magenta, bold = true },
					}
				end,

				-- Override a color entirely
				colors = {
					-- For a list of colors see `lua/cyberdream/colours.lua`
					-- Example:
					bg = "#000000",
					green = "#00ff00",
					magenta = "#ff00ff",
				},

				-- Disable or enable colorscheme extensions
				extensions = {
					telescope = true,
					notify = true,
					mini = true,
					lazy = true,
					dashboard = true,
					snacks = true,
				},
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},
	{
		-- "folke/tokyonight.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- opts = {},
		-- init = function()
		-- 	vim.cmd("colorscheme tokyonight-night")
		-- end,
	},
}
