return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		vim.keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Jump to next todo" })

		vim.keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Jump to previous todo" })

		todo_comments.setup()
	end,
}
