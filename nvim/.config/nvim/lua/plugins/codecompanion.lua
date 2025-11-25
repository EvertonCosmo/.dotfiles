return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
		opts = {
			render_modes = true,
			sign = {
				enabled = false,
			},
		},
	},
	{
		"HakonHarnes/img-clip.nvim",
		opts = {
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
			},
		},
	},
	{
		"echasnovski/mini.diff",
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				source = diff.gen_source.none(),
			})
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"j-hui/fidget.nvim",
			"ravitemer/codecompanion-history.nvim",
			{ "nvim-lua/plenary.nvim", branch = "master" },
			"nvim-treesitter/nvim-treesitter",
			"ravitemer/mcphub.nvim",
		},
		config = function()
			require("codecompanion").setup({
				extensions = {
					history = {
						enabled = true,
						opts = {
							keymap = "gh",
							save_chat_keymap = "sc",
							auto_save = true,
							auto_generate_title = true,
							continue_last_chat = false,
							delete_on_clearing_chat = false,
							picker = "fzf-lua",
							enable_logging = false,
							dir_to_save_chat = vim.fn.stdpath("data") .. "/codecompanion-history",
						},
					},
					mcphub = {
						callback = "mcphub.extensions.codecompanion",
						opts = {
							make_vars = true,
							make_slash_commands = true,
							show_result_in_chat = true,
						},
					},
				},

				adapters = {
					http = {
						copilot = function()
							return require("codecompanion.adapters").extend("copilot", {
								schema = {
									model = {
										-- default = "claude-sonnet-4.5",
                    default = "gemini-3-pro-preview",
									},
								},
							})
						end,
					},
				},
			})
			local mcphub = require("mcphub")
      mcphub.setup()
			-- mcphub.setup({
			-- 	port = 3000,
			--      -- build = "bundled_build.lua",
			--      -- use_bundled_binary = true,
			-- 	config = os.getenv("HOME") .. "/.config/mcp-servers.json",
			-- 	on_ready = function(hub)
			-- 		vim.notify(
			-- 			string.format("MCP Hub is ready. %s servers active", #vim.tbl_filter(function(s)
			-- 				return s.status == "connected"
			-- 			end, hub:get_state().server_state.servers or {})),
			-- 			vim.log.levels.INFO
			-- 		)
			-- 	end,
			-- })

			local progress = require("fidget.progress")
			local handles = {}
			local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

			vim.api.nvim_create_autocmd("User", {
				pattern = "CodeCompanionRequestStarted",
				group = group,
				callback = function(e)
					handles[e.data.id] = progress.handle.create({
						title = "CodeCompanion",
						message = "Thinking...",
						lsp_client = { name = e.data.adapter.formatted_name },
					})
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "CodeCompanionRequestFinished",
				group = group,
				callback = function(e)
					local h = handles[e.data.id]
					if h then
						h.message = e.data.status == "success" and "Done" or "Failed"
						h:finish()
						handles[e.data.id] = nil
					end
				end,
			})

			vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
			-- vim.keymap.set("n", "<leader>ca", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
			vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

			-- Expand 'cc' into 'CodeCompanion' in the command line
			vim.cmd([[cab cc CodeCompanion]])
		end,
	},
}
