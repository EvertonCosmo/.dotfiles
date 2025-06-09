return {

	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = false,
		})

		vim.keymap.set("n", "<leader>ga", function()
			vim.cmd.Gitsigns("blame")
		end, { desc = "Blame line" })

		vim.keymap.set("n", "<leader>gb", function()
			vim.cmd.Gitsigns("blame_line")
		end, { desc = "Blame line" })

		vim.keymap.set("n", "<leader>gp", function()
			vim.cmd.Gitsigns("preview_hunk")
		end, { desc = "Preview hunk" })

	end,
}
