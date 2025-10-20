return {

	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			html = { "htmlhint" },
			-- go = { "codespell", "golangcilint" },
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
