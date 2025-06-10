local formatter_data = {
	prettier = {
		".prettierrc",
		".prettierrc.json",
		".prettierrc.yml",
		".prettierrc.yaml",
		".prettierrc.json5",
		".prettierrc.js",
		".prettierrc.cjs",
		".prettierrc.mjs",
		".prettierrc.toml",
		"prettier.config.js",
		"prettier.config.cjs",
		"prettier.config.mjs",
	},
	eslint = {
		".eslintrc",
		".eslintrc.json",
		"eslint.config.mjs",
	},
	["biome"] = {
		"biome.json",
		"biome.jsonc",
	},
}

return {
	{
		"rrethy/vim-illuminate",
		config = function()
			require("illuminate")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "j-hui/fidget.nvim" },
		config = function()
			local fidget = require("fidget")
			local conform = require("conform")

			fidget.setup({})
			conform.setup({
				formatters = {

					prettier = {
						cwd = require("conform.util").root_file(formatter_data.prettier),
						require_cwd = true,
					},
					biome = {
						cwd = require("conform.util").root_file(formatter_data.biome),
						require_cwd = true,
					},
				},
				formatters_by_ft = {
					c = { "clang_format" },
					cpp = { "clang_format" },
					css = { "biome", "prettier", "stylelint" },
					less = { "prettier", "stylelint" },
					go = { "gofmt", "goimports" },
					html = { "prettier", "htmlbeautifier" },
					javascript = { "biome", "prettier" },
					javascriptreact = { "biome", "prettier" },
					json = { "biome", "prettier" },
					jsonc = { "biome" },
					lua = { "stylua" },
					sh = { "shellcheck", "shfmt" },
					sql = { "sql_formatter" },
					svelte = { "biome", "prettier" },
					templ = { "templ", "injected" },
					typescript = { "biome", "prettier" },
					typescriptreact = { "biome", "prettier" },
					vue = { "biome", "prettier" },
					yaml = { "biome", "prettier" },
				},
				-- format_on_save = function(bufnr)
				--     if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				--         return
				--     end
				--     return { timeout_ms = 500, lsp_fallback = true }
				-- end,
				--[[ vim.api.nvim_create_autocmd("BufWritePre", {
	               pattern = "*",
	               callback = function(args)
	                   require("conform").format({ bufnr = args.buf })
	               end,
	           }), ]]

				vim.keymap.set({ "n", "v" }, "<leader>f", function()
					conform.format({
						lsp_fallback = true,
						async = true,
					})
				end),
			})

			local function find_closest_config_file(config_names, current_file)
				if config_names == nil then
					return nil
				end
				for _, config_name in ipairs(config_names) do
					local found =
						vim.fs.find(config_name, { upward = true, path = vim.fn.fnamemodify(current_file, ":p:h") })
					if #found > 0 then
						return found[1] -- Return the closest config file found
					end
				end
				return nil -- No config file found
			end

			vim.api.nvim_create_user_command("Format", function()
				local formatters = conform.list_formatters(0)
				local current_file = vim.api.nvim_buf_get_name(0)

				if #formatters == 0 then
					vim.notify("No formatters available for this buffer, using lsp", vim.log.levels.WARN)
					conform.format({ async = false, lsp_format = "fallback" })
					return
				end

				local formatter_to_use = nil
				for _, formatter in ipairs(formatters) do
					local config_file = find_closest_config_file(formatter_data[formatter.name], current_file)
					if config_file then
						formatter_to_use = formatter.name
						break
					end
				end

				if not formatter_to_use then
					formatter_to_use = formatters[1].name -- Fallback to the first available formatter
					vim.notify("Using formatter: " .. formatter_to_use, vim.log.levels.INFO)
					return
				end

				vim.notify("Using formatter: " .. formatter_to_use, vim.log.levels.INFO)
				conform.format({ async = false, lsp_format = "never", formatters = { formatter_to_use } })
			end, {})

			vim.api.nvim_create_user_command("FormatWithPrettier", function()
				require("conform").format({ async = true, lsp_format = "never", formatters = { "prettier" } })
			end, {})

			vim.api.nvim_create_user_command("FormatWithBiome", function()
				require("conform").format({ async = true, lsp_format = "never", formatters = { "biome" } })
			end, {})
		end,
	},
}
