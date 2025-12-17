local function get_python_path(workspace)
	if vim.env.VIRTUAL_ENV then
		return util.path.join(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	-- Search for virtualenv in workspace
	for _, pattern in ipairs({ "*", ".*" }) do
		local match = vim.fn.glob(util.path.join(workspace, pattern, "pyproject.toml"))
		if match ~= "" then
			return util.path.join(util.path.dirname(match), "bin", "python")
		end
	end

	-- Fallback to system Python
	return exepath("python3") or exepath("python") or "python"
end
return {
	-- 	cmd = { "pyright-langserver", "--stdio" },
	-- 	filetypes = {
	-- 		"python",
	-- 	},
	-- 	root_markers = {
	-- 		".git",
	-- 		"Pipfile",
	-- 		"pyproject.toml",
	-- 		"pyrightconfig.json",
	-- 		"requirements.txt",
	-- 		"setup.cfg",
	-- 		"setup.py",
	-- 	},
	-- 	-- https://microsoft.github.io/pyright/#/settings?id=pyright-settings
	-- 	--
	-- 	settings = {
	-- 		pyright = {
	-- 			strict = true,
	-- 		},
	-- 		python = {
	-- 			analysis = {
	-- 				autoSearchPaths = true,
	-- 				useLibraryCodeForTypes = true,
	-- 				diagnosticMode = "openFilesOnly",
	-- 			},
	-- 		},
	-- 	},
	--
	-- 	before_init = function(_, config)
	-- 		config.settings.python.pythonPath = get_python_path(config.root_dir)
	-- 	end,
	--
	-- 	single_file_support = true,
}
