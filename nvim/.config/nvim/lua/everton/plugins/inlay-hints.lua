return {
	"MysticalDevil/inlay-hints.nvim",
	event = "LspAttach",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("inlay-hints").setup({
			eol = {
				parameter = {
					separator = ", ",
					format = function(hint)
						local max_length = 20
						if #hint > max_length then
							return hint:sub(1, max_length) .. "..."
						end
						return hint
					end,
				},
			},
		})
	end,
}
