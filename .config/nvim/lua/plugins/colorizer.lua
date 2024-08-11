return {
	"norcalli/nvim-colorizer.lua",
	version = "*",
	event = "BufRead",
	config = function ()
		require"colorizer".setup({
			'css',
			'javascript',
			'swayconfig',
			'jsonc',
			'json',
			html = {
				mode = "foreground",
			}
		})
	end
}
