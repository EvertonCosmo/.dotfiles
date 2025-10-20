vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.cursorline = false
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.undofile = true

vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.pumblend = 0

vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.undolevels = 10000

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"

vim.opt.background = "dark"

vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.formatoptions:append({ "r" })

vim.opt.completeopt = "menuone,noselect"

vim.g.markdown_recommended_style = 0

vim.o.winborder = "rounded"
vim.opt.grepprg = "rg --vimgrep" -- use ripgrep
vim.opt.conceallevel = 2

-- file handling
vim.opt.undofile = true
vim.opt.autoread = true

vim.opt.diffopt:append("algorithm:patience")
vim.opt.diffopt:append("linematch:60")
---
---
---
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.path:append("*")
vim.opt.selection = "inclusive"
vim.opt.showmode = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.encoding = "UTF-8"

-- folder
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
