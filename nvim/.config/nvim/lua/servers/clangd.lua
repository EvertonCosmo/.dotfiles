--- @return nil
return function()
  vim.lsp.config('clangd', {
    cmd = {
      'clangd',
      '--background-index',
      '--clang-tidy',
      '--completion-style=detailed',
      '--header-insertion=iwyu',
      '--function-arg-placeholders',
      '--all-scopes-completion',
      '--pch-storage=memory',
      '--offset-encoding=utf-16',
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = {
      'compile_commands.json',
      'compile_flags.txt',
      '.clangd',
      'meson.build',
      'CMakeLists.txt',
      'Makefile',
      '.git',
    },
    init_options = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeUnimported = true,
      semanticHighlighting = true,
    },
  })
end
