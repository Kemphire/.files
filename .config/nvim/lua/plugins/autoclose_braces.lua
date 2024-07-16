return {
	"m4xshen/autoclose.nvim",
	config = function()
		require('autoclose').setup {
			disable = {  },
			ignored_next_char = "[%w%.]", -- will not autoclose when next character is alphanumeric or dot
			ignored_filetypes = {  },
			filetypes = { 'lua', 'c', 'cpp', 'rust', 'python', 'javascript', 'typescript', 'html', 'css', 'json', 'yaml', 'toml', 'vim','jinja' },
		}
	end
}
