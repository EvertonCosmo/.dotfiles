return {
	"JFryy/keytrail.nvim",
	depencencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("keytrail").setup({
			filetypes = { json = true, yaml = true },
			delimiter = ".",
		})
	end,
}
