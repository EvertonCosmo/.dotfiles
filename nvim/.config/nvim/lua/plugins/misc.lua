return {
	{
		"j-hui/fidget.nvim",
		opts = {
			progress = {
				ignore = {
					["jdtls"] = true, -- Still ignore JDTLS in fidget as a backup
				},
			},
		},
	},
	{
		"b0o/schemastore.nvim",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			render = "background",
			enable_named_colors = true,
			enable_tailwind = true,
		},
	},

	{
		-- vim ilumminate
		"RRethy/vim-illuminate",
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}

