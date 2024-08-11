return {
  "lervag/vimtex",
	ft = { "tex", "bib" },
  version = "*", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_method = "xetex"
  end
}
