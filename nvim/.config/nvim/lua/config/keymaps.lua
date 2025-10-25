local opts = { noremap = true, silent = true }


vim.keymap.set("n", "<leader>pv",vim.cmd.Ex)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- window navigation
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- incremental rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- clear all buffers, not include current one
vim.keymap.set("n", "<leader>!", ":Clean<CR>", { noremap = true, silent = true })

-- inlay hints
vim.keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)

-- clean hightlight on search
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- indent in visual mode
vim.keymap.set("v","<", "<gv", {desc ="Indent left"})
vim.keymap.set("v",">", ">gv", {desc ="Indent right"})

 -- copilot super tab 

vim.keymap.set('i', '<Tab>', function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { desc = "Super Tab" })
