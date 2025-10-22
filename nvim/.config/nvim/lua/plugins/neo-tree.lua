
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
    lazy = false,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visible = true,
						hide_hidden = true,
						hide_dotfiles = false,
						hide_gitignored = true,
						hide_by_name = { "node_modules" },
					},
				},
				follow_current_file = true,
				use_libuv_file_watcher = true,
				auto_expand_width = true,
			})
			vim.keymap.set("n", "<leader><Tab>", "<Cmd>Neotree toggle<CR>", { desc = "open files tree" })
			vim.keymap.set("n", "<leader>e", ":Neotree reveal_force_cwd<CR>")
		end,
	},
	{

		"DaikyXendo/nvim-material-icon",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
			if not web_devicons_ok then
				return
			end

			local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")
			if not material_icon_ok then
				return
			end

			web_devicons.setup({ override = material_icon.get_icons() })

			require("nvim-material-icon").setup()
		end,
	},
	{
		"skardyy/neo-img",
		build = ":NeoImg Install",
		config = function()
			require("neo-img").setup({
				backend = "kitty", -- gosth terminal works with kitty protocol -- macos
			})
		end,
	},
}
