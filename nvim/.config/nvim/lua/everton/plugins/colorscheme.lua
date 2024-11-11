return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		require("tokyonight").setup({

			-- style = "night",
			--
			-- transparent = true,
			-- terminal_colors = true,
			--
			-- styles = {
			-- 	comments = { italic = true },
			-- 	functions = { bold = true },
			-- 	keywords = { italic = true },
			-- },
			--
		})
		vim.cmd([[colorscheme tokyonight-night]])
		vim.cmd([[hi Comment gui=none]])
	end,
}
