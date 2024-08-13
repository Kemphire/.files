return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		opts = {
			ensure_installed = {
				"clang-format",
				"latexindent",
			}
		}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"quick_lint_js",
					"clangd",
					"pyright",
					"html",
					"emmet_language_server",
					"cssls",
					"texlab",
				},
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			-- lspconfig.clangd.setup({
			-- 	capabilities = capabilities,
			-- })
			lspconfig.quick_lint_js.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			lspconfig.ccls.setup({
				capabilities=capabilities,
				on_attach = function (client, bufnr)
					
				end,
				flags = {
					debounce_text_changes = 150,
				},
				cmd = {"/usr/bin/ccls"},
				init_options = {
					clang = {
						extraARGS = {"--stdc++17"},
					}
				}
			})

			vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
			vim.keymap.set({ "v", "n" }, "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
