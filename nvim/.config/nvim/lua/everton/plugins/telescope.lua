return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x", -- or, branch = '0.1.x',
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local actions = require("telescope.actions")
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-p>"] = actions.move_selection_previous,
							["<C-n>"] = actions.move_selection_next,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						},
					},
				},
				--[[ defaults = {
					layout_config = {
						horizontal = { preview_cutoff = 0 },
					},
				} ]]
			})

			telescope.load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><space>", builtin.buffers, {})
			vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set("n", "<leader>?", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>gs", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
			vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Todos" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = { file_ignore_patterns = { "node_modules" } },
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- to get ui-select loaded and working with telescope, you need to call
			require("telescope").load_extension("ui-select")
			-- load_extension, somewhere after setup function:
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
}
