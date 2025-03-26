return {
	"echasnovski/mini.files",
	version = "*",
	config = function()
		require("mini.files").setup({
			mappings = {
				synchronize = "<CR>",
				go_in_plus = "l",
			},
			windows = {
				preview = true,
			},
			options = {
				use_as_default_explorer = false,
			},
		})

		vim.keymap.set("n", "<C-l>", function()
			MiniFiles.open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Open file in Minifiles" })
	end,
}
