return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				style = "night",
				terminal_colors = true,
				transparent = true,
				floats = "dark",
				sidebars = "dark",
			})
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			-- vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
