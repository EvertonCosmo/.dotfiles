return {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("nightfox").setup({
				options = {
					-- transparent = true,
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal
					dim_inactive = false, -- Non focused panes set to alternative background
				},
			})
			vim.cmd.colorscheme("carbonfox")
		end,
	},
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("melange")
		end,
	},
}
