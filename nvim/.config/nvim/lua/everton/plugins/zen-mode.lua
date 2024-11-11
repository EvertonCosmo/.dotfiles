return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	opts = {
		window = {
			width = 120,
		},
		plugins = {
			gitsigns = { enabled = true },
			tmux = { enabled = true },
		},
	},
	keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
