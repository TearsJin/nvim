local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("Can not find nvim-tree")
	return
end


local function my_on_patch(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return {desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', 'v', api.node.open.vertical, opts("vsplit"))
	vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts("Next Sibling"))
--	vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts("UP"))

end

	


local list_key = require('keybindings').nvimTreeList
nvim_tree.setup({
	git = {
		enable = false,
	},

	-- project plugin
	update_cwd = tree,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},

	-- hidden
	filters = {
		dotfiles = false,
		custom = { 'node_modules' },
	},
	view = {
		width = 40,
		side = 'left',
		--hide_root_folder = false,
		--mappings = {
		--	custom_only = false,
		--	list = list_keys,
		--},
		-- not display line number
		number = false,
		relativenumber = false,

		-- display icon
		signcolumn = 'yes',
	},
	actions = {
		open_file = {
		  resize_window = true,
		  quit_on_open = true,
		},
	},

	system_open = {
		cmd = 'wsl-open', 
	},

	-- project plugin config
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},

	on_attach = my_on_patch,
})

vim.cmd([[
	autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif	
]]
)
