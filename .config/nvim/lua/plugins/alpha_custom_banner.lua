return {
	'goolord/alpha-nvim',
	event = "VimEnter",
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-lua/plenary.nvim'
	},
	config = function()
		require('alpha').setup(require 'alpha.themes.theta'.config)
	end
}
