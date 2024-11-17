return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	ft = { "html", "javascript", "typescript", "css", "scss", "vue", "typescriptreact", "javascriptreact" },
	config = function()
		require("nvim-ts-autotag").setup({})
	end,
}
