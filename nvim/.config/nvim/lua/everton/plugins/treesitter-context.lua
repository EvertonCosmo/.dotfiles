return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup({
			enable = true,
			line_numbers = true,
			max_lines = 5,
			multiwindow = false
		})
	end,
}
