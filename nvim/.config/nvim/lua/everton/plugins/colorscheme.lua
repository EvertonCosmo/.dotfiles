return {
	{
		"Koalhack/darcubox-nvim",
		config = function()
			-- vim.cmd("colorscheme darcubox")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({})
			-- vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				keywordStyle = { italic = false },
				overrides = function(colors)
					local palette = colors.palette
					return {
						String = { italic = true },
						Boolean = { fg = palette.dragonPink },
						Constant = { fg = palette.dragonPink },

						Identifier = { fg = palette.dragonBlue },
						Statement = { fg = palette.dragonBlue },
						Operator = { fg = palette.dragonGray2 },
						Keyword = { fg = palette.dragonRed },
						Function = { fg = palette.dragonGreen },

						Type = { fg = palette.dragonYellow },

						Special = { fg = palette.dragonOrange },

						["@lsp.typemod.function.readonly"] = { fg = palette.dragonBlue },
						["@variable.member"] = { fg = palette.dragonBlue },
					}
				end,
			})
			-- vim.cmd("colorscheme kanagawa-dragon")
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			-- vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal
					dim_inactive = false, -- Non focused panes set to alternative background
				},
			})
			vim.cmd.colorscheme("carbonfox")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				inverse = true,
				contrast = "",
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})

			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_background = "medium" -- hard, soft, medium
			vim.g.gruvbox_material_foreground = "material" -- original, mix, material
			vim.g.gruvbox_material_sign_column_background = "none"
			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
