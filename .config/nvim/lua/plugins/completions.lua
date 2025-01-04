-- return {
-- 	{
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		event = "InsertEnter",
-- 	},
-- 	{
-- 		"L3MON4D3/LuaSnip",
-- 		event = "InsertEnter",
-- 		dependencies = {
-- 			"saadparwaiz1/cmp_luasnip",
-- 			"rafamadriz/friendly-snippets",
-- 		},
-- 	},
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		lazy = true,
-- 		config = function()
-- 			local cmp = require("cmp")
-- 			require("luasnip.loaders.from_vscode").lazy_load()
-- 			cmp.setup({
-- 				snippet = {
-- 					-- REQUIRED - you must specify a snippet engine
-- 					expand = function(args)
-- 						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
-- 					end,
-- 				},
-- 				window = {
-- 					-- completion = cmp.config.window.bordered(),
-- 					-- documentation = cmp.config.window.bordered(),
-- 				},
-- 				mapping = cmp.mapping.preset.insert({
-- 					["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 					["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 					["<C-e>"] = cmp.mapping.abort(),
-- 					["<CR>"] = cmp.mapping.confirm({ select = true }),
--
-- 					-- activate completions only when ctrl+n is pressed
-- 					-- if completions is already active then pressing ctrl+n will will select next suggestion
--
-- 					vim.api.nvim_set_keymap("i", "<C-Space>", "", { noremap = true, silent = true }),
-- 					vim.api.nvim_set_keymap("s", "<C-Space>", "", { noremap = true, silent = true }),
-- 					["<C-Space>"] = cmp.mapping(function(fallback)
-- 						if cmp.visible() then
-- 							cmp.select_next_item()
-- 						else
-- 							cmp.mapping.complete()
-- 						end
-- 					end, { "i", "s" }),
-- 				}),
-- 				sources = cmp.config.sources({
-- 					{ name = "nvim_lsp" },
-- 					{ name = "luasnip" },
-- 				}, {
-- 					{ name = "buffer" },
-- 				}),
-- 				completion = {
-- 					autocomplete = false,
-- 				},
-- 				enabled = function()
-- 					-- disable completion in comment
-- 					local context = require("cmp.config.context")
-- 					-- keep command mode completion enabled when cursor is in a comment
-- 					if vim.api.nvim_get_mode().mode == "c" then
-- 						return true
-- 					else
-- 						return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
-- 					end
-- 				end,
-- 			})
--
-- 			-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- 			-- Set configuration for specific filetype.
-- 			--[[ cmp.setup.filetype('gitcommit', {
-- 	sources = cmp.config.sources({
-- 	  { name = 'git' },
-- 	}, {
-- 	  { name = 'buffer' },
-- 	})
-- 	})
-- 	require("cmp_git").setup() ]]
-- 			--
--
-- 			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- 			cmp.setup.cmdline({ "/", "?" }, {
-- 				mapping = cmp.mapping.preset.cmdline(),
-- 				sources = {
-- 					{ name = "buffer" },
-- 				},
-- 			})
-- 		end,
-- 	},
-- 	-- {
-- 	-- 	"saghen/blink.cmp",
-- 	-- 	lazy = false, -- lazy loading handled internally
-- 	-- 	-- optional: provides snippets for the snippet source
-- 	-- 	dependencies = { "rafamadriz/friendly-snippets", "hrsh7th/nvim-cmp" },
-- 	--
-- 	-- 	-- use a release tag to download pre-built binaries
-- 	-- 	version = "v0.*",
-- 	-- 	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
-- 	-- 	-- build = 'cargo build --release',
-- 	-- 	-- If you use nix, you can build from source using latest nightly rust with:
-- 	-- 	-- build = 'nix run .#build-plugin',
-- 	--
-- 	-- 	---@module 'blink.cmp'
-- 	-- 	---@type blink.cmp.Config
-- 	-- 	opts = {
-- 	-- 		-- 'default' for mappings similar to built-in completion
-- 	-- 		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
-- 	-- 		-- see the "default configuration" section below for full documentation on how to define
-- 	-- 		-- your own keymap. when defining your own, no keybinds will be assigned automatically.
-- 	-- 		keymap = "default",
-- 	--
-- 	-- 		highlight = {
-- 	-- 			-- sets the fallback highlight groups to nvim-cmp's highlight groups
-- 	-- 			-- useful for when your theme doesn't support blink.cmp
-- 	-- 			-- will be removed in a future release, assuming themes add support
-- 	-- 			use_nvim_cmp_as_default = true,
-- 	-- 		},
-- 	-- 		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
-- 	-- 		-- adjusts spacing to ensure icons are aligned
-- 	-- 		nerd_font_variant = "normal",
-- 	--
-- 	-- 		-- experimental auto-brackets support
-- 	-- 		-- accept = { auto_brackets = { enabled = true } }
-- 	--
-- 	-- 		-- experimental signature help support
-- 	-- 		-- trigger = { signature_help = { enabled = true } }
-- 	-- 	},
-- 	-- },
-- }
return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "*",
		opts = {
			keymap = {
				preset = "default",
				["<C-Space>"] = { "show" }, -- Use Ctrl+Space to trigger completion
				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
