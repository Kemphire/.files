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
				"biome",
			},
		},
	},

	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("mason-lspconfig").setup({
	-- 			ensure_installed = {
	-- 				"lua_ls",
	-- 				"quick_lint_js",
	-- 				"clangd",
	-- 				"pyright",
	-- 				"html",
	-- 				"emmet_language_server",
	-- 				"cssls",
	-- 				"texlab",
	-- 				"ruff",
	-- 				"taplo",
	-- 				"biome",
	-- 			},
	-- 			auto_install = true,
	-- 		})
	-- 	end,
	-- },
}
