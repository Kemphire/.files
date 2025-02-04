-- load nvim lsp
local util = require("lspconfig.util")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.html" },

	callback = function()
		local root = util.root_pattern("manage.py")(vim.fn.expand("%:p"))
		if root then
			vim.bo.filetype = "htmldjango"
		end
	end,
})
