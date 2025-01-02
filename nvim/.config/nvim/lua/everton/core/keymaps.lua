vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- clean hightlight on search
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- window navigation
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>")

-- Get out Q
-- vim.keymap.set("n", "Q", "<nop>")

-- clear all buffers, not the current one
vim.keymap.set("n", "<leader>!", ":Clean<CR>", { noremap = true, silent = true })

-- inlay hints

vim.keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)

-- package-info keymaps
vim.keymap.set(
	"n",
	"<leader>cpt",
	"<cmd>lua require('package-info').toggle()<cr>",
	{ silent = true, noremap = true, desc = "Toggle" }
)
vim.keymap.set(
	"n",
	"<leader>cpd",
	"<cmd>lua require('package-info').delete()<cr>",
	{ silent = true, noremap = true, desc = "Delete package" }
)
vim.keymap.set(
	"n",
	"<leader>cpu",
	"<cmd>lua require('package-info').update()<cr>",
	{ silent = true, noremap = true, desc = "Update package" }
)
vim.keymap.set(
	"n",
	"<leader>cpi",
	"<cmd>lua require('package-info').install()<cr>",
	{ silent = true, noremap = true, desc = "Install package" }
)
vim.keymap.set(
	"n",
	"<leader>cpc",
	"<cmd>lua require('package-info').change_version()<cr>",
	{ silent = true, noremap = true, desc = "Change package version" }
)

-- Obsidian
--
vim.keymap.set(
	"n",
	"<leader>oc",
	"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
	{ desc = "Obsidian Check Checkbox" }
)
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })

-- Terminal

vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm direction=float<CR>", opts)

vim.api.nvim_create_user_command("Clean", function()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		if buf ~= current_buf then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, {})

-- incremental rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- format code
-- vim.keymap.set("n", "<leader>f", ":Format<CR>")

vim.keymap.set("n", "<C-n>", function()
	vim.cmd("Neotree filesystem reveal left toggle")
	vim.g.use_image_nvim = true
end, { silent = true })

function _G.set_terminal_keymaps()
	vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = 0, noremap = true, silent = true })
end

vim.api.nvim_create_augroup("term_open_custom", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
	group = "term_open_custom",
	pattern = "*",
	callback = function()
		vim.defer_fn(function()
			if vim.api.nvim_get_option_value("buftype", { buf = vim.api.nvim_get_current_buf() }) == "terminal" then
				vim.cmd([[startinsert]])
			end
		end, 100)
	end,
})

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
