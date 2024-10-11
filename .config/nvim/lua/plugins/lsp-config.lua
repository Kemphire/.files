return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
		opts = {
			ensure_installed = {
				"clang-format",
				"latexindent",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		lazy = true,
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
					"ruff_lsp",
				},
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.quick_lint_js.setup({
				capabilities = capabilities,
			})

			-- hover in favour of pyright --
			local on_attach = function(client, bufnr)
				if client.name == "ruff_lsp" then
					client.server_capabilities.hoverProvider = false
				end
			end
			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- pyright setup to detect virtualenv's
			local configs = require("lspconfig/configs")
			local util = require("lspconfig/util")

			local path = util.path

			local function get_python_path(workspace)
				-- Use activated virtualenv.
				if vim.env.VIRTUAL_ENV then
					return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
				end

				-- Find and use virtualenv in workspace directory.
				for _, pattern in ipairs({ "*", ".*" }) do
					local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
					if match ~= "" then
						return path.join(path.dirname(match), "bin", "python")
					end
				end

				-- Fallback to system Python.
				return exepath("python3") or exepath("python") or "python"
			end
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							ignore = { "*" },
						},
					},
				},
				before_init = function(_, config)
					config.settings.python.pythonPath = get_python_path(config.root_dir)
				end,
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			lspconfig.jinja_lsp.setup({
				capabilities = capabilities,
				filetypes = { "html", "htmldjango" },
			})
			-- lspconfig.ccls.setup({
			-- 	capabilities=capabilities,
			-- 	on_attach = function (client, bufnr)
			--
			-- 	end,
			-- 	flags = {
			-- 		debounce_text_changes = 150,
			-- 	},
			-- 	cmd = {"/usr/bin/ccls"},
			-- 	init_options = {
			-- 		clang = {
			-- 			extraARGS = {"--stdc++17"},
			-- 		}
			-- 	}
			-- })

			vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, { desc = "Lsp definatin popup" })
			vim.keymap.set({ "v", "n" }, "<leader>gd", vim.lsp.buf.definition, { desc = "Lsp go to defination" })
			vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp code action" })
		end,
	},
}
