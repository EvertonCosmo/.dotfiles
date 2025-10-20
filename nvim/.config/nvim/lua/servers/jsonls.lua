--- @param capabilities table LSP client capabilities
--- @return nil
return function(capabilities)
	vim.lsp.config('jsonls', {
		capabilities = capabilities,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})
end
