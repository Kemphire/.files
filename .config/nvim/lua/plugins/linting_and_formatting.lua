return {
	-- "nvimtools/none-ls.nvim",
	-- event = "BufWinEnter",
	-- lazy = true,
	-- config = function()
	-- 	local null_ls = require("null-ls")
	-- 	null_ls.setup({
	-- 		debug = true,
	-- 		sources = {
	-- 			null_ls.builtins.formatting.stylua,
	-- 			null_ls.builtins.formatting.black,
	-- 			null_ls.builtins.formatting.prettier,
	-- 			null_ls.builtins.formatting.clang_format,
	-- 			null_ls.builtins.formatting.black,
	-- 			null_ls.builtins.formatting.isort,
	-- 		},
	-- 	})
	-- 	vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})
	-- end,
	"stevearc/conform.nvim",
	event = "BufWritePre",
	init = function()
		local conform = require("conform")

		-- conform.formatters_by_ft.htmldjango = { "prettier" }
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff", "ruff_format", "ruff_fix", "ruff_fix" },
				html = { "htmlbeautifier" },
				-- htmldjango = { "djlint" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				javascript = { "prettier" },
				bash = { "beautysh" },
				tex = { "texfmt" },
				css = { "prettier" },
				htmldjango = { "djlint" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
			formatters = {
				texfmt = {
					command = "$HOME/.cargo/bin/tex-fmt",
				},
			},
		})
	end,
}
