return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	opts = {
		window = {
			width = 90,
		},
		plugins = {
			gitsigns = { enabled = true },
			tmux = { enabled = true },
		},
		on_close = function()
			require("incline").enable()
		end,
		on_open = function()
			require("incline").disable()
		end,
	},
	keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
