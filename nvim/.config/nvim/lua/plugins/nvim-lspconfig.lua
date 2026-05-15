return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"hrsh7th/cmp-nvim-lsp",
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			require("utils.diagnostics").setup()
			require("lsp-file-operations").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"stylua",
					"ts_ls",
					"bashls",
					"cssls",
					"jsonls",
					"html",
					"eslint",
					"gopls",
					"clangd",
					"yamlls",
					"prismals",
					"terraformls",
					"tailwindcss",
					"pylsp",
				},
			})

			require("servers")
		end,
	},
}
