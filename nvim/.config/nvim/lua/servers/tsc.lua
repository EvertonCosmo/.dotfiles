--- @return nil
return function()
  vim.lsp.config('tsc', {
    settings = {
      ['js/ts'] = {
        inlayHints = {
          parameterNames = {
            enabled = 'all',
            suppressWhenArgumentMatchesName = false,
          },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        },
        referencesCodeLens = {
          enabled = true,
          showOnAllFunctions = true,
        },
        implementationsCodeLens = {
          enabled = true,
          showOnInterfaceMethods = true,
          showOnAllClassMethods = true,
        },
      },
    },
  })
end
