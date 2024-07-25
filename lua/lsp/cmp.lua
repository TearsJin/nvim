local status, cmp = pcall(require, "cmp")

if not status then
	vim.notify("Can not find cmp")
	return
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

	mapping = require("keybindings").cmp(cmp)
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

