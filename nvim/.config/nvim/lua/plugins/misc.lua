return {

	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"b0o/schemastore.nvim",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},

	-- {
	-- 	"rrethy/vim-illuminate",
	-- 	config = function()
	-- 		require("illuminate")
	-- 	end,
	-- },
}
