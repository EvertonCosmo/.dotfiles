--- @return nil
return function()
	-- JetBrains official Kotlin LSP (Mason package: kotlin-lsp, binary: intellij-server).
	vim.lsp.config("kotlin_lsp", {
		cmd = { "intellij-server", "--stdio" },
		filetypes = { "kotlin" },
		root_markers = {
			"settings.gradle.kts",
			"settings.gradle",
			"build.gradle.kts",
			"build.gradle",
			"pom.xml",
			"workspace.json",
			".git",
		},
	})
end
