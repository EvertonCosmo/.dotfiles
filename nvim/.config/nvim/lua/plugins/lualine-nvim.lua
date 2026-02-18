---@diagnostic disable: unused-local
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "cameronr/lualine-pretty-path" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local function trunc(start_col, trunc_width, trunc_len, hide_width)
			return function(str)
				local win_width = vim.fn.winwidth(0)
				if hide_width and win_width < hide_width then
					return ""
				end
				if win_width < trunc_width and #str > trunc_len then
					return str:sub(start_col, trunc_len) .. "..."
				end
				return str
			end
		end
		-- Show LSP status, borrowed from Heirline cookbook
		-- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md#lsp
		local function lsp_status_all()
			local haveServers = false
			local names = {}
			for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
				haveServers = true
				table.insert(names, server.name)
			end
			if not haveServers then
				return ""
			end
			-- if vim.g.custom_lualine_show_lsp_names then
			return table.concat(names, ",")
			-- end
			-- return " "
		end
		local colors = {
			color0 = "#092236",
			color1 = "#ff5874",
			color2 = "#c3ccdc",
			color3 = "#1c1e26",
			color6 = "#a1aab8",
			color7 = "#828697",
			color8 = "#ae81ff",
		}
		local my_lualine_theme = {
			replace = {
				a = { fg = colors.color0, bg = colors.color1, gui = "bold" },
				b = { fg = colors.color2, bg = colors.color3 },
			},
			inactive = {
				a = { fg = colors.color6, bg = colors.color3, gui = "bold" },
				b = { fg = colors.color6, bg = colors.color3 },
				c = { fg = colors.color6, bg = colors.color3 },
			},
			normal = {
				a = { fg = colors.color0, bg = colors.color7, gui = "bold" },
				b = { fg = colors.color2, bg = colors.color3 },
				c = { fg = colors.color2, bg = colors.color3 },
			},
			visual = {
				a = { fg = colors.color0, bg = colors.color8, gui = "bold" },
				b = { fg = colors.color2, bg = colors.color3 },
			},
			insert = {
				a = { fg = colors.color0, bg = colors.color2, gui = "bold" },
				b = { fg = colors.color2, bg = colors.color3 },
			},
		}

		-- local mode = {
		-- 	"mode",
		-- 	fmt = function(str)
		-- 		-- return ' '
		-- 		-- displays only the first character of the mode
		-- 		return " " .. str
		-- 	end,
		-- }

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			-- cond = hide_in_width,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}

		local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "|" }

		lualine.setup({
			icons_enabled = true,
			options = {
				-- theme = my_lualine_theme,
				-- theme = "gruvbox-material",
				-- theme = "cyberdream",
        theme = "rose-pine",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
			},
			sections = {
				-- lualine_a = { mode },
				lualine_a = {},
				-- lualine_b = { branch },
				lualine_b = {},
				lualine_c = {
					diff,
					{
						"pretty_path",
						providers = {
							default = require("utils.pretty-harpoon"),
						},
						directories = {
							max_depth = 4,
						},
						highlights = {
							newfile = "LazyProgressDone",
						},
						separator = "",
					},
				},
				-- lualine_c = { diff, filename },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- { "encoding",},
					-- { "fileformat" },
					{ "filetype" },
					{ "copilot" },
					-- require("utils.lualine-util").cmp_source("supermaven", "󰰣"),
					-- {
					-- 	lsp_status_all,
					-- 	fmt = trunc(0, 8, 140, false),
					-- 	separator = "",
					-- },
				},
			},
		})
	end,
}
