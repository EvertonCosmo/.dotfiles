return {
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 10000,
		},
		config = function()
			vim.notify = require("notify")
		end,
	},
}
