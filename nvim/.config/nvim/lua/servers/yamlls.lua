-- @param capabilities table LSP client capabilities
-- @return nil
return function(capabilities)
  vim.lsp.config('yamlls', {
    capabilities = capabilities,
  })
end
