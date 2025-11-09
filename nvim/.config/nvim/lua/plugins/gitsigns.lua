return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local vimkeymap = vim.keymap
		local vimcmd = vim.cmd
		require("gitsigns").setup({
			current_line_blame = false,
		})

		vimkeymap.set("n", "<leaderga", function()
			vimcmd.Gitsigns("blame")
		end, { desc = "Git Blame" })

		vimkeymap.set("n", "<leadergb", function()
			vimcmd.Gitsigns("toggle_current_line_blame")
		end, { desc = "Toggle Git Blame" })

		vimkeymap.set("n", "<leadergp", function()
			vimcmd.Gitsigns("preview_hunk")
		end, { desc = "Preview Git Hunk" })
	end,
}
