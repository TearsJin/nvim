local status, cmp = pcall(require, "cmp")

if not status then
	vim.notify("Can not find cmp")
	return
end

local status, lspkind = pcall(require, "lspkind")

if not status then
	vim.notify("Can not find lspking")
end

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp"},
		{ name = "vsnip"},
	},{
	  { name = "buffer" },
	  { name = "path" }
	}),

	mapping = require("keybindings").cmp(cmp),

	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			maxwidth = 50,
			before = function(entry, vim_item)
				vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
				return vim_item
			end,
		})
	}
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer"},
	},
})


cmp.setup.cmdline(": ", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	},{
		{ name = "cmdline" },
	}),
})
local vsnip_snippet_dir = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
vim.g.vsnip_snippet_dir = table.concat({
  -- vsnip_snippet_dir .. 'vim-snippets/snippets',
  vsnip_snippet_dir .. 'friendly-snippets/snippets'
}, ',')
