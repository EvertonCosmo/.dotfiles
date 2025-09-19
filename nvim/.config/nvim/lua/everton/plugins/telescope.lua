return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x", -- or, branch = '0.1.x',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"andrew-george/telescope-themes",
			"nvim-tree/nvim-web-devicons",
			"https://git.myzel394.app/Myzel394/jsonfly.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		config = function()
			local actions = require("telescope.actions")
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					file_ignore_patterns = {
						"node_modules/.*",
						".git/.*",
						"yarn.lock",
						"dist",
						"build",
						"target",
						".vscode/.*",
					},
					layout_config = {
						horizontal = {
							width = 0.9,
						},
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
					extensions = {
						themes = {
							enable_previewer = true,
							enable_live_preview = true,
							persist = {
								enabled = true,
								path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
							},
						},
					},
					-- mappings = {

					-- 	i = {
					-- 		["<C-p>"] = actions.move_selection_previous,
					-- 		["<C-n>"] = actions.move_selection_next,
					-- 		["<C-q>"] = function(prompt_bufnr)
					-- 			actions.smart_send_to_qflist(prompt_bufnr)
					-- 			actions.open_qflist(prompt_bufnr)
					-- 		end,
					-- 	},
					-- },
					pickers = {
						find_files = {
							find_command = { "rg", "--hidden", "--smart-case" },
							theme = "ivy",
						},
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args")
			telescope.load_extension("ui-select")
			telescope.load_extension("jsonfly")
			telescope.load_extension("themes")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git Files" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help tags" })
			vim.keymap.set("n", "<leader><space>", builtin.buffers, {})
			
			vim.keymap.set("n", "<leader>?", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
			vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Todos" })
			vim.keymap.set("n", "<leader>j", "<Cmd>Telescope jsonfly<CR>", { desc = "search current JSON structure" })
			vim.keymap.set(
				"n",
				"<leader>ths",
				"<cmd>Telescope themes<CR>",
				{ desc = "Telescope themes", noremap = true, silent = true }
			)

			-- multi grep
			vim.keymap.set("n", "<leader>X", require("everton/util/multi_grep").setup, { desc = "search text" })

			vim.keymap.set("n", "<leader>/", function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
					layout_config = { width = 0.9 },
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })
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
