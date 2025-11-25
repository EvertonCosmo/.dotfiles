local M = {}

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

M.setup = function()
	vim.keymap("n", "<leader>ud", function()
		vim.diagnostic.config({ underline = not not vim.g.diagnostic_enabled })
		vim.g.diagnostic_enabled = not vim.g.diagnostic_enabled
	end, { silent = true, noremap = true, desc = "Toggle Diagnostics Underline" })

	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
				[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
				[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
				[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
			},
		},
		virtual_text = false,
		update_in_insert = true,
		float = {
			underline = true,
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = true,
			header = "",
			prefix = "",
		},
	})
end

return M
