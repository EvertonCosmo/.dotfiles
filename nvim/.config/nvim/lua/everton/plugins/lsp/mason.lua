return {

	{
		"williamboman/mason.nvim",
		dependencies = {
			"j-hui/fidget.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",
			"b0o/schemastore.nvim",
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
			mason_lsp.setup_handlers({ function(server_name) lspconfig[server_name].setup({ capabilities = default_capabilities, }) end,

				-- ["eslint"] = function()
				--     lspconfig["eslint"].setup({
				--         capabilities = default_capabilities,
				--         on_attach = function(client, bufnr)
				--             client.server_capabilities.documentFormattingProvider = false      -- 0.8 and later
				--             client.server_capabilities.documentRangeFormattingProvider = false -- 0.8 and later
				--             client.server_capabilities.diagnosticsProvider = false
				--         end,
				--     })
				-- end,

				["html"] = function()
					lspconfig["html"].setup({
						capabilities = default_capabilities,
					})
				end,
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({

						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
									maxPreload = 10000,
									preloadFileSize = 10000,
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
						-- capabilities = default_capabilities,
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
