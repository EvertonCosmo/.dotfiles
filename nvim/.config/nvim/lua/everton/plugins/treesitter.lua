return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
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

				additional_vim_regex_highlighting = false,
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				use_virtual_text = true,
			})
		end,
	},
	{
		"m-demare/hlargs.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = true,
	},
}
