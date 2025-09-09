-- return {
--     "mfussenegger/nvim-lint",
--     event = { "BufReadPre", "BufNewFile" },
--     config = function()
--         local lint = require("lint")
--         local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
--         local eslint = lint.linters.eslint_d
--
--         -- if Eslint error configuration not found : change MasonInstall eslint@version or npm i -g eslint at a specific version
--         lint.linters_by_ft = {
--             typescript = { "biomejs", "eslint_d", "eslint" },
--             javascript = { "biomejs", "eslint_d", "eslint" },
--             typescriptreact = { "biomejs", "eslint_d", "eslint" },
--             javascriptreact = { "biomejs", "eslint_d", "eslint" },
--         }
--
--         -- eslint = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
--         -- try to ignore "No ESLint configuration found" error
--         -- if diagnostic.message:find("Error: No ESLint configuration found") then -- old version
--         -- update: 20240814, following is working
--         -- 	if diagnostic.message:find("Error: Could not find config file") then
--         -- 		return nil
--         -- 	end
--         -- 	return diagnostic
--         -- end)
--         -- eslint.args = {
--         --     "--format",
--         --     "json",
--         --     "--stdin",
--         --     "--stdin-filename",
--         --     function()
--         --         return vim.api.nvim_buf_get_name(0)
--         --     end,
--         -- }
--         --
--         -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--         --     group = lint_augroup,
--         --     callback = function()
--         --         lint.try_lint()
--         --     end,
--         -- })
--
--         vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
--             group = lint_augroup,
--             callback = function()
--                 local eslint_exists = vim.fn.filereadable(".eslintrc.json") == 1 or
--                     vim.fn.filereadable(".eslintrc.js") == 1
--                 local biome_exists = vim.fn.filereadable("biome.json") == 1 or vim.fn.filereadable(".biomerc") == 1
--
--                 if eslint_exists then
--                     lint.try_lint("eslint_d")
--                 elseif biome_exists then
--                     lint.try_lint("biomejs")
--                 end
--             end,
--         })
--
--         vim.keymap.set("n", "<leader>l", function()
--             lint.try_lint()
--         end, { desc = "Trigger linting for current file" })
--     end,
-- }
--
--[[ return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lint").linters = {
			biomejs = {
				condition = function(ctx)
					return vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
				end,
			},
			eslint_d = {
				condition = function(ctx)
					return vim.fs.find(
						{ ".eslintrc.cjs", ".eslintrc.js", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml" },
						{ path = ctx.filename, upward = true }
					)[1]
				end,
			},
			luacheck = {
				condition = function(ctx)
					return vim.fs.find({ ".luacheckrc" }, { path = ctx.filename, upward = true })[1]
				end,
			},
		}

		require("lint").linters_by_ft = {
			javascript = { "biomejs", "eslint_d" },
			javascriptreact = { "biomejs", "eslint_d" },
			lua = { "luacheck" },
			html = { "htmlhint"},
			typescript = { "biomejs", "eslint_d" },
			typescriptreact = { "biomejs", "eslint_d" },
			svelte = { "biomejs", "eslint_d" },
			vue = { "biomejs", "eslint_d" },
		}

		vim.api.nvim_create_user_command("Lint", function()
			require("lint").try_lint()
		end, {})

		vim.api.nvim_create_user_command("LintWithBiome", function()
			require("lint").try_lint("biomejs")
		end, {})

		vim.api.nvim_create_user_command("LintWithEslint", function()
			require("lint").try_lint("eslint_d")
		end, {})
	end,
} ]]

return {

	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			html = { "htmlhint" },
			go = { "codespell", "golangcilint" },
			sh = { "bash", "shellcheck" },
			zsh = { "shellcheck", "zsh" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })

		vim.api.nvim_create_user_command("Lint", function()
			require("lint").try_lint()
		end, {})
	end,
}
