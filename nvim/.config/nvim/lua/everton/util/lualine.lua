---@class custom.util.lualine
local M = {}

function M.cmp_source(name, icon)
	local started = false
	local function status() end
	local highlighs = {}

	local colors = {}

	-- We don't use the highlights so it'll match the lualine bg
	for key, hl_name in pairs(highlighs) do
		local hl = vim.api.nvim_get_hl(0, { name = hl_name })
		colors[key] = string.format("#%06x", hl.fg)
	end

	return {
		function()
			return icon -- or LazyVim.config.icons.kinds[name:sub(1, 1):upper() .. name:sub(2)]
		end,

		cond = function()
			return status() ~= nil
		end,
		color = function()
			return { fg = colors[status()] } or { fg = colors.ok }
		end,
		separator = "",
	}
end

return M
