local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.djlint,
				null_ls.builtins.formatting.clang_format,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function() end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})
	end,
}
