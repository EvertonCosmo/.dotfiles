--- @return nil
return function()
  vim.lsp.config('neocmakelsp', {
    cmd = { 'neocmakelsp', 'stdio' },
    filetypes = { 'cmake' },
    root_markers = { 'CMakePresets.json', 'CMakeLists.txt', 'build', '.git' },
    init_options = {
      format = { enable = true },
      lint = { enable = true },
      scan_cmake_in_package = true,
      semantic_token = false,
    },
  })
end
