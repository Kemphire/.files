return {
	cmd = {
		"texlab",
	},
	filetypes = { "tex", "plaintex", "bib" },
	root_markers = { ".git", ".latexmkrc", "latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml" },
	settings = {
		texlab = {
			bibtexFormatter = "texlab",
			build = {
				args = { "-X",
					"compile",
					"%f",
					"--synctex",
					"--keep-logs",
					"--keep-intermediates" },
				executable = "tectonic",
				forwardSearchAfter = false,
				onSave = false,
			},
			chktex = {
				onEdit = false,
				onOpenAndSave = false,
			},
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = {
				args = {},
			},
			latexFormatter = "texfmt",
			latexindent = {
				modifyLineBreaks = false,
			},
		},
	},
}
