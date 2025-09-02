vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10

vim.opt.numberwidth = 2
vim.opt.cursorline = false
vim.opt.signcolumn = "yes"

vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.foldenable = false
vim.opt.foldlevel = 99

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.completeopt = "menuone,noselect"

vim.opt.wildignore:append({ "*/node_modules/*" })

vim.opt.formatoptions:append({ "r" })

vim.opt.background = "dark"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.updatetime = 100
--vim.opt.colorcolumn = "80"

vim.opt.conceallevel = 2

-- vim.g.gui_font_face = "Maple Mono NF"
vim.g.gui_font_face = "Comic Code Medium"
