local toggleSuperMaven = function()
	local supermaven_api = require("supermaven-nvim.api")

	vim.g.supermaven_enable = not vim.g.supermaven_enable

	local nofification = require("notify")

	local notification_opts = {
		title = "SuperMaven",
		timeout = 1000,
		hide_from_history = true,
	}

	if vim.g.supermaven_enable then
		nofification("SuperMaven enabled", "info", notification_opts)
		supermaven_api.start()
	else
		nofification("SuperMaven disabled", "error", notification_opts)
		supermaven_api.stop()
	end
end

return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<tab>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-k>",
				},
			})
			vim.api.nvim_create_user_command("ToggleSuperMaven", toggleSuperMaven, { range = false })
			vim.keymap.set("n", "<leader>S", "<cmd>ToggleSuperMaven<cr>", { desc = "Toogle SuperMaven" })
		end,
	},
}
