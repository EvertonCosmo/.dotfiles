return {
	"ThePrimeagen/harpoon",
	enabled = true,
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		})
		vim.keymap.set("n", "<leader>A", function()
			harpoon:list():prepend()
		end)
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)

			vim.keymap.set("n", "<C-i>", function()
				harpoon:list():select(2)
			end)

			vim.keymap.set("n", "<C-b>", function()
				harpoon:list():select(3)
			end)

			vim.keymap.set("n", "<C-p>", function()
				harpoon:list():select(4)
			end)

			vim.keymap.set("n", "<leader><C-h>", function()
				harpoon:list():replace_at(1)
			end)
			vim.keymap.set("n", "<leader><C-i>", function()
				harpoon:list():replace_at(2)
			end)
			vim.keymap.set("n", "<leader><C-b>", function()
				harpoon:list():replace_at(3)
			end)
			vim.keymap.set("n", "<leader><C-p>", function()
				harpoon:list():replace_at(4)
			end)
		end)
	end,
}
