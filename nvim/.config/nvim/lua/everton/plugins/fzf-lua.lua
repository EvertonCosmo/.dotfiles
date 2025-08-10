return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>gb", require("fzf-lua").git_bcommits, {
			silent = true,
			desc = "Git FZF (B)commits",
		})
		vim.keymap.set("n", "<leader>gs", require("fzf-lua").git_status, {
			noremap = true,
			silent = true,
			desc = "Git FZF (S)tatus",
		})
	end,
}
