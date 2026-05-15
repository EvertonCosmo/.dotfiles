--- @return nil
return function()
  vim.lsp.config('pylsp', {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            enabled = true,
            maxLineLength = 120,
          },
          pyflakes = { enabled = true },
          pylint = { enabled = false },
          mccabe = { enabled = true },
          flake8 = { enabled = false },
          jedi_completion = {
            enabled = true,
            include_params = true,
            fuzzy = true,
          },
          jedi_hover = { enabled = true },
          jedi_references = { enabled = true },
          jedi_signature_help = { enabled = true },
          jedi_symbols = { enabled = true, all_scopes = true },
          rope_completion = { enabled = true },
        },
      },
    },
  })
end
