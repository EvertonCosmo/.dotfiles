return {
	{
		-- NOTE: investigate why it's not working
		-- "williamboman/mason.nvim",
		"mason-org/mason.nvim",
		dependencies = {
			"j-hui/fidget.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",
			"b0o/schemastore.nvim",
			{ "mason-org/mason.nvim", version = "^1.0.0" },
			{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
		},

		config = function()
			require("fidget").setup({})
			require("mason").setup({})

			local lspconfig = require("lspconfig")
			local mason_lsp = require("mason-lspconfig")
			mason_lsp.setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"jsonls",
					"eslint",
					"biome",
					"jsonls",
					"html",
					"cssls",
					"tailwindcss",
					"gopls",
					"clangd",
				},
				automatic_installation = true,
			})

			local default_capabilities = require("cmp_nvim_lsp").default_capabilities()
			mason_lsp.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({ capabilities = default_capabilities })
				end,

				["eslint"] = function()
					lspconfig["eslint"].setup({
						capabilities = default_capabilities,
					})
				end,

				["html"] = function()
					lspconfig["html"].setup({
						capabilities = default_capabilities,
					})
				end,

				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = default_capabilities,

						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								hint = {
									enable = true,
								},
							},
						},
					})
				end,

				["ts_ls"] = function()
					lspconfig["ts_ls"].setup({
						capabilities = default_capabilities,
						settings = {
							typescript = {
								inlayHints = {
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = true,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
									includeInlayVariableTypeHintsWhenTypeMatchesName = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayEnumMemberValueHints = true,
								},
							},
							javascript = {
								inlayHints = {
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = true,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
									includeInlayVariableTypeHintsWhenTypeMatchesName = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayEnumMemberValueHints = true,
								},
							},
						},
						init_options = {
							preferences = {
								includeCompletionsWithSnippetText = true,
								includeCompletionsForImportStatements = true,
							},
							plugins = {
								{
									name = "typescript-styled-plugin",
									location = "global",
								},
							},
						},
					})
				end,

				["jsonls"] = function()
					lspconfig["jsonls"].setup({
						capabilities = default_capabilities,
						settings = {
							json = {
								schemas = require("schemastore").json.schemas(),
								validate = { enable = true },
							},
						},
					})
				end,

				["gopls"] = function()
					lspconfig["gopls"].setup({
						capabilities = default_capabilities,
						settings = {
							gopls = {
								hints = {
									assignVariableTypes = true,
									compositeLiteralFields = true,
									compositeLiteralTypes = true,
									constantValues = true,
									functionTypeParameters = true,
									parameterNames = true,
									rangeVariableTypes = true,
								},
							},
						},
					})
				end,
			})
		end,
	},
}
