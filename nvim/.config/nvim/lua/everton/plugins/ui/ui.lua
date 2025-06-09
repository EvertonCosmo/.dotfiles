return {
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local helpers = require("incline.helpers")
			local devicons = require("nvim-web-devicons")
			require("incline").setup({
				hide = {
					only_win = false,
				},
				ignore = {
					floating_wins = false,
					wintypes = function(winid, wintype)
						local zen_view = package.loaded["zen-mode.view"]
						if zen_view and zen_view.is_open() then
							return winid ~= zen_view.win
						end
						return wintype ~= ""
					end,
				},
				window = {
					padding = 0,
					margin = { horizontal = 0 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if filename == "" then
						filename = "[No Name]"
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified
					return {
						ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
							or "",
						" ",
						{ filename, gui = modified and "bold,italic" or "bold" },
						" ",
						guibg = "#44406e",
					}
				end,
			})
		end,
	},
}
