return {

	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	opts = {
		adapters = {
			copilot = function()
				return require("code-companion.adapters").extend("copilot", {
					autocomplete = false,
					schema = {
						model = {
							default = "claude-3.7-sonnet",
						},
					},
					display = {
						chat = {
							show_settings = true,
						},
					},
				})
			end,
		},
	},
}
