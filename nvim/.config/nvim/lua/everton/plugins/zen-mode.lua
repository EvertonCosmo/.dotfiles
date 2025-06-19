return {
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			window = {
				width = 160,
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
	},
	-- {
	-- 	"folke/twilight.nvim",
	-- 	cmd = "Twilight",
	-- 	keys = { { "<leader>Z", "<cmd>Twilight<cr>", desc = "Zen Twilight" } },
	-- }
}
