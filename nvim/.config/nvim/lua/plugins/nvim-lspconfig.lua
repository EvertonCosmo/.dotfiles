return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"hrsh7th/cmp-nvim-lsp",
		"mason-org/mason-lspconfig.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		require("utils.diagnostics").setup()
		require("lsp-file-operations").setup()
		local masonlsp = require("mason-lspconfig")
		masonlsp.setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"bashls",
				"cssls",
				"jsonls",
				"html",
				"eslint",
				"gopls",
				"clangd",
			},
			automatic_installation = true,
		})
		require("servers")
	end,
}
