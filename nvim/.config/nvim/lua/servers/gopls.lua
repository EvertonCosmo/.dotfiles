--- @param capabilities table LSP client capabilities
--- @return nil
return function(capabilities)
	vim.lsp.config('gopls', {
		capabilities = capabilities,
		settings = {
			gopls = {
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	})
end
