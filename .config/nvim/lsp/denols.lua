return {
	cmd = { "deno", "lsp" },
	root_markers = { "deno.json", "deno.jsonc" },
	settings = {
		deno = {
			enable = true,
			suggest = {
				imports = {
					hosts = {
						["https://deno.land"] = true,
					},
				},
			},
		},
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "LspDenolsCache", function()
			client:exec_cmd({
				command = "deno.cache",
				arguments = { {}, vim.uri_from_bufnr(bufnr) },
			}, { bufnr = bufnr }, function(err, _, ctx)
				if err then
					local uri = ctx.params.arguments[2]
					vim.notify("cache command failed for" .. vim.uri_to_fname(uri), vim.log.levels.ERROR)
				end
			end)
		end, {
			desc = "Cache a module and all of its dependencies.",
		})
	end,
}
