vim.cmd("autocmd BufEnter * set formatoptions-=cro")

-- disabled spell check for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "txt" },
	callback = function()
		vim.opt_local.spell = false
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "ObsidianNoteEnter",
	callback = function(ev)
		vim.keymap.del("n", "<CR>", { buffer = ev.buf })
		vim.keymap.set("n", "<leader><CR>", require("obsidian.api").smart_action, { buffer = ev.buf })
	end,
})

local on_attach = require("lsp.lsp").on_attach

local lsp_on_attach_group = vim.api.nvim_create_augroup("LspMappings", {})

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_on_attach_group,
	callback = on_attach,
})

-- clean all buffers except current one
vim.api.nvim_create_user_command("Clean", function()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		if buf ~= current_buf then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		require("lsp.java").setup()
	end,
})
