--- @param capabilities table LSP client capabilities
--- @return nil
return function(capabilities)
	vim.lsp.config('bashls', {
		capabilities = capabilities,
	})
end
