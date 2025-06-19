return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			hint = {
				enable = true,
				setType = true, -- Show type hints for variables
				paramType = true, -- Show parameter type hints
				await = true, -- Show hints for async functions
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
				maxPreload = 1000, -- Limit preloaded files for performance
				preloadFileSize = 150, -- Skip large files
			},
		},
	},
}
