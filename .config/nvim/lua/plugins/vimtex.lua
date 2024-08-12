return {
  "lervag/vimtex",
	lazy = false,
  version = "*", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "sioyek"
		vim.g.vimtex_compiler_method = "pdflatex"
  end
}
