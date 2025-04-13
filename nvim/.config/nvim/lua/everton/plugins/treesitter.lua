return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufEnter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"java",
				"diff",
				"html",
				"css",
				"styled",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"go",
				"javascript",
				"typescript",
				"jsdoc",
				"json",
				"dockerfile",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},

			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			use_virtual_text = true,
		})
	end,
}
