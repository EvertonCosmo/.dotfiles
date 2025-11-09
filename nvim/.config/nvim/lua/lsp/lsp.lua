local M = {}

M.on_attach = function(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	local buffer = event.buf

	if not client then
		return
	end

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { buffer = buffer })
		vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#808080", italic = true })
	end

	local keymapset = vim.keymap.set
	local opts = { noremap = true, silent = true, buffer = buffer }

	keymapset("n", "gD", vim.lsp.buf.declaration, opts)
	-- keymapset("n", "gd", vim.lsp.buf.definition, opts)
	keymapset("n", "gd", function()
		require("fzf-lua").lsp_definitions({
			jump1 = true,
		})
	end, opts)
	keymapset("n", "<leader>gS", "<cmd>usplit | lua vim.lsp.buf.definition()<CR>", opts)
	keymapset("n", "<leader>ca", function()
		require("fzf-lua").lsp_code_actions({
			previewer = false,
			winopts = {
				width = 0.5,
				height = 0.3,
				border = "rounded",
				row = 0.5,
				col = 0.5,
			},
		})
	end, opts)
	-- keymapset("n", "<leader>rn", vim.lsp.buf.rename, opts) -- in favor of inc-rename.nvim
	-- diagnostics
	keymapset("n", "<leader>D", function()
		vim.diagnostic.open_float({ scope = "line" })
	end, opts)

	keymapset("n", "<leader>d", vim.diagnostic.open_float, opts)

	keymapset("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts)

	keymapset("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts)

	keymapset("n", "K", vim.lsp.buf.hover, opts)
	-- keymapset("n", "K", function()
	-- 	vim.lsp.buf.hover({ border = "rounded" })
	-- end, opts)

	keymapset("n", "<leader>rs", ":LspRestart<CR>", opts)

	-- fzf-lua keymaps
	-- keymapset("n", "<leader>gd", "<cmd>FzfLua lsp_finder<CR>", opts) -- LSP Finder (definition + references)
	-- keymapset("n", "<leader>gr", "<cmd>FzfLua lsp_references<CR>", opts) -- Show all references to the symbol under the cursor
	-- keymapset("n", "<leader>gt", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- Jump to the type definition of the symbol under the cursor
	-- keymapset("n", "<leader>ds", "<cmd>FzfLua lsp_document_symbols<CR>", opts) -- List all symbols (functions, classes, etc.) in the current file
	-- keymapset("n", "<leader>ws", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts) -- Search for any symbol across the entire project/workspace
	-- keymapset("n", "<leader>gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- Go to implementation

	-- keymapset("n", "<leader>gd", vim.lsp.buf.definition, opts)
	keymapset("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts)
	keymapset("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)
	keymapset("n", "<leader>ds", "<cmd>FzfLua lsp_document_symbols<CR>", opts)
	keymapset("n", "<leader>ws", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts)
end

return M
