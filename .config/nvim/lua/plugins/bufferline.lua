return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	config = function()
		local diagnostics_provider = "nvim_lsp"
		require("bufferline").setup({
			options = {
				diagnostics = diagnostics_provider,
			},
		})
	end,
}
