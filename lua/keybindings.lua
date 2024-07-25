vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap

local opt = {noremap = true, silent = true}


map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<A-Right>", ":vsplit<CR>", opt)
map("n", "<CR>", "i", opt)
map("n", "<C-Down>", "yyp", opt)
map("n", "<C-x>", "dd", opt)

-- plugins keybind
map("i", "<A-Down>", "<C-o>:m +1<CR>", opt)
map("i", "<A-Up>", "<C-o>:m .-2<CR>", opt)
map("i", "<C-Down>", "<C-o>yy<C-o>p", opt)
map("i", "<C-x>", "<C-o>dd", opt)
map("i", "<C-c>", "<C-o>yy", opt)
map("i", "<C-v>", "<C-o>p", opt)
map("i", "<C-z>", "<C-o>:undo<CR>", opt)
map("i", "<C-s>", "<Esc>:w<CR>", opt)

local pluginKeys = {}

-- nvim-tree
map("n","<A-/>", ":NvimTreeToggle<CR>", opt)

pluginKeys.nvimTreeList = {
	{ Key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
	{ Key = "v", action = "vsplit" },
	{ Key = "h", action = "split" },
	{ Key = "i", action = "toggle_custom" },
	{ Key = ".", action = "toggle_dotfiles" },
	{ Key = "<F5>", action = "refresh" },
	{ Key = "a", action = "create" },
	{ Key = "d", action = "remove" },
	{ Key = "r", action = "rename" },
	{ Key = "x", action = "cut" },
	{ Key = "c", action = "copy" },
	{ Key = "p", action = "paste" },
	{ Key = "s", action = "system_open" },
}

-- bufferline
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)



-- pickwin
--
map("n", "<C-q>", ":lua vim.api.nvim_set_current_win(tonumber(tostring(require('winpick').select())))<CR>",opt)

-- telescope
map("n", "f", ":Telescope find_files<CR>", opt)

-- Lsp
pluginKeys.mapLSP = function(mapbuf)	
end

-- nvim-cmp
pluginKeys.cmp = function(cmp)
	return	{
	 ["<C-Down>"] = cmp.mapping.select_next_item(),
	 ["<C-Up>"] = cmp.mapping.select_prev_item(),
	 -- ["<CR>"] = cmp.mapping.confirm({
	--	select = true,
	--	behavior = cmp.ConfirmBehavior.Replace
	 --}),
   }
end

-- comment
pluginKeys.comment = {
	-- Normal
	toggle = {
		line = "gcc",
		block = "gbc"
	},
	-- Visual
	opleader = {
		line = "gc",
		block = "gb"
	}
}



return pluginKeys
