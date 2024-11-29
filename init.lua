require('basic')
require('keybindings')
require('plugins')
require('colorscheme')
require("myplugin")
require('plugin-config.nvim-notify')
require('plugin-config.nvim-tree')
require("plugin-config.winpick")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.comment")
require("plugin-config.glow")
require("plugin-config.vimtex")
require("lsp.setup")
require("lsp.cmp")

vim.cmd([[
	augroup filetypedetect
		autocmd!
		autocmd BufRead, BufNewFile *.sage setfiletype python
	augroup END
]])
