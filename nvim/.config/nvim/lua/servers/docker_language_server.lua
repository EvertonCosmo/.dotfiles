-- @param capabilities table
-- @return nil
return function(capabilities)
  vim.lsp.config('dockerls', {
    capabilities = capabilities
  })
end
