return {
	"AlexandrosAlexiou/kotlin.nvim",
	ft = { "kotlin" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		-- Used for package-folder navigation and moving files with updated references.
		-- Neo-tree stays the file explorer.
		{ "stevearc/oil.nvim", opts = { default_file_explorer = false } },
		"folke/trouble.nvim",
	},
	init = function()
		-- Mason's kotlin-lsp download 404s (JetBrains CDN needs signed URLs), so the
		-- server is installed by hand from the GitHub release into this directory.
		vim.env.KOTLIN_LSP_DIR = vim.env.KOTLIN_LSP_DIR or vim.fn.expand("~/.local/share/kotlin-lsp")
	end,
	opts = {},
}
