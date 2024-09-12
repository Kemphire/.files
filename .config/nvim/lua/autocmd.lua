-- for persistent code folding
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})

-- to check if a file exist or not
function file_exists(filename)
	local file = io.open(filename, "r")
	if file then
		file:close()
		return true
	else
		return false
	end
end

--  if there is a sesssion.vim file containig session load if
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Add a delay of 500ms before sourcing the session.vim
		vim.defer_fn(function()
			if file_exists("session.vim") then
				vim.cmd("source session.vim")
			end
		end, 500) -- Delay in milliseconds
	end,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		if file_exists("session.vim") then
			vim.cmd("mksession! session.vim")
		end
	end,
})

-- for line number coloring before loading colorscheme
function LineNumberColors()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#f5ec42", bold = true })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#f54245", bold = true })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#f5ec42", bold = true })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		LineNumberColors()
	end,
})

-- for hiding status line when not in cmd mode
local function hide_cmd()
	local cmd_type = vim.fn.getcmdtype()
	if cmd_type == "/" or cmd_type == "?" then
		vim.defer_fn(function()
			vim.cmd("set cmdheight=0")
		end, 2000)
	else
		vim.cmd("set cmdheight=0")
	end
end

local function show_cmd()
	vim.cmd("set cmdheight=1")
end

vim.api.nvim_create_autocmd("CmdlineEnter", {
	pattern = "*",
	callback = show_cmd,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	pattern = "*",
	callback = hide_cmd,
})
