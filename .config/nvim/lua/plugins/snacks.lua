return {
	"folke/snacks.nvim",
	priority = 1000,
	dependencies = { "echasnovski/mini.icons", version = "*" },
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
				{
					section = "terminal",
					cmd = "pokemon-colorscripts -r -s --no-title; sleep .1",
					random = 10,
					pane = 2,
					indent = 15,
					height = 30,
				},
			},
			keys = {
				{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
			},
		},
		termianl = {
			shell = "/usr/bin/fish",
		},
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		explorer = {
			enabled = false,
			layout = {
				cycle = false,
			},
		},
		toggle = { enabled = true },
		indent = {
			enabled = true,
			priority = 1,
			char = "|",
			only_scope = true,
			only_current = true,
			hl = "SnacksIndent8",
		},
		animate = {
			enabled = vim.fn.has("nvim-0.10") == 1,
			style = "out",
			easing = "linear",
			duration = {
				step = 10, -- ms per step
				total = 300, -- maximum duration
			},
		},
		chunk = {
			only_current = true,
		},
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
		scroll = {
			animate = {
				duration = { step = 15, total = 250 },
				easing = "linear",
			},
			-- faster animation when repeating scroll after delay
			animate_repeat = {
				delay = 100, -- delay in ms before using the repeat animation
				duration = { step = 5, total = 50 },
				easing = "linear",
			},
			-- what buffers to animate
			filter = function(buf)
				return vim.g.snacks_scroll ~= false
					and vim.b[buf].snacks_scroll ~= false
					and vim.bo[buf].buftype ~= "terminal"
			end,
		},
		image = {
			enabled = true,
			doc = {
				-- Personally I set this to false, I don't want to render all the
				-- images in the file, only when I hover over them
				-- render the image inline in the buffer
				-- if your env doesn't support unicode placeholders, this will be disabled
				-- takes precedence over `opts.float` on supported terminals
				inline = vim.g.neovim_mode == "skitty" and true or false,
				-- only_render_image_at_cursor = vim.g.neovim_mode == "skitty" and false or true,
				-- render the image in a floating window
				-- only used if `opts.inline` is disabled
				float = true,
				-- Sets the size of the image
				-- max_width = 60,
				max_width = vim.g.neovim_mode == "skitty" and 20 or 60,
				max_height = vim.g.neovim_mode == "skitty" and 10 or 30,
				-- max_height = 30,
				-- Apparently, all the images that you preview in neovim are converted
				-- to .png and they're cached, original image remains the same, but
				-- the preview you see is a png converted version of that image
				--
				-- Where are the cached images stored?
				-- This path is found in the docs
				-- :lua print(vim.fn.stdpath("cache") .. "/snacks/image")
				-- For me returns `~/.cache/neobean/snacks/image`
				-- Go 1 dir above and check `sudo du -sh ./* | sort -hr | head -n 5`
			},
		},
		picker = {
			icons = {
				files = {
					enabled = true,
				},
			},
			sources = { explorer = { layout = { position = "right" } } },
			layout = {
				preset = "ivy",
				cycle = false,
			},
			debug = {
				scores = false,
			},
			matcher = {
				frequency = true,
				fuzzy = true,
				smartcase = true,
			},
		},
	},
	keys = {
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function()
				Snacks.terminal()
			end,
			desc = "which_key_ignore",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		{
			"<leader>es",
			function()
				Snacks.explorer.open(opts)
			end,
			desc = "Open snacks explorer",
		},
		-- snacks picker keymaps
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files, using snacks picker",
		},
		{
			"<leader>pc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Open config files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Search buffers, using snacks picker",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Search help tags",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep string in files",
		},
		{
			"<leader>pws",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep current word",
		},
		{
			"<leader>th",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Select colorschemes",
		},
		{
			"<leader>pwc",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Fuzzy search, Neovim commands",
		},
		{
			"<leader>mn",
			function()
				Snacks.picker.man()
			end,
			desc = "Man pages, search",
		},
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
			end,
		})
	end,
}
