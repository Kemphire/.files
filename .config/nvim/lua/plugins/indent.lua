return {
	"echasnovski/mini.indentscope",
	version = "*",
	config = function()
		local autocmd = vim.api.nvim_create_autocmd
		local exclude_filetype = {
			"undotree",
			"dashboard",
			"norg",
			"trouble",
			"help",
			"snacks_dashboard",
			"man",
		}
		require("mini.indentscope").setup({
			-- Options which control scope computation
			options = {
				-- Type of scope's border: which line(s) with smaller indent to
				-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
				border = "both",

				-- Whether to use cursor column when computing reference indent.
				-- Useful to see incremental scopes with horizontal cursor movements.
				indent_at_cursor = true,

				-- Whether to first check input line to be a border of adjacent scope.
				-- Use it if you want to place cursor on function header to get scope of
				-- its body.
				try_as_border = false,
			},

			-- Which character to use for drawing scope indicator
			symbol = "╎",
			draw = {
				-- to disable any animation
				animation = require("mini.indentscope").gen_animation.none(),
			},
		})

		autocmd({ "Filetype" }, {
			desc = "Disable indentoscope for certain ft's",
			pattern = table.concat(exclude_filetype, ","),
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
