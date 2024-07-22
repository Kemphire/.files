return {
	"nvimtools/none-ls.nvim",
	lazy = false,
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			debug = true,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.black,
			},
		})
		vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})
	end,
}
