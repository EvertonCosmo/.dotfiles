vim.cmd("autocmd BufEnter * set formatoptions-=cro")

-- disabled spell check for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "txt" },
	callback = function()
		vim.opt_local.spell = false
	end,
})

return {}
