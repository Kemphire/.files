return {
	"lervag/vimtex",
	-- lazy =  false,
	event = "BufWinEnter",
	version = "*", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "sioyek"
		vim.g.vimtex_compiler_method = "luatex"
		vim.g.vimtex_quickfix_open_on_warning = 0
		vim.g.tex_conceal = ""
	end,
}
