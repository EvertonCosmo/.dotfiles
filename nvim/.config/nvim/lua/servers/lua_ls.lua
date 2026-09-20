--- @return nil
return function()
	vim.lsp.config("lua_ls", {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME .. "/lua",
						"${3rd}/luv/library",
					},
				},
				completion = {
					callSnippet = "Replace",
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})
end
