return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup({})

		vim.keymap.set({ "n", "v" }, "<leader>r", function()
			require("refactoring").select_refactor({
				show_success_message = true,
			})
		end, { silent = true, noremap = true, expr = false })
	end,
}
