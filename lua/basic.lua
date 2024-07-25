-- utf-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.wo.number = true
vim.wo.relativenumber = false

vim.wo.cursorline = true

vim.wo.signcolumn = "yes"

vim.wo.colorcolumn = "120"

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

vim.o.expandtab = false
vim.bo.expandtab = false

vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = true

vim.o.incsearch = true

vim.o.cmdheight = 2

vim.o.autoread = true
vim.bo.autoread = true

vim.wo.wrap = true

vim.o.whichwrap = '<,>,[,]'

vim.o.hidden = true

vim.o.mouse = "a"

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.updatetime = 300

vim.o.timeoutlen = 500

vim.o.splitbelow = true
vim.o.splitright = true

vim.g.completeopt = "menu,menuone,noselect,noinsert"

vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

vim.o.list = true

vim.o.wildmenu = true

vim.o.shortmess = vim.o.shortmess .. 'c'

vim.o.pumheight = 10

vim.o.showtabline = 4

vim.o.showmode = false
