--- @return nil
return function()
	vim.lsp.config("make_ls", {
		cmd = { "make-ls" },
		filetypes = { "make" },
		root_markers = { "Makefile", "makefile", "GNUmakefile", ".git" },
	})
end
