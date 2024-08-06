vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(modes, lhs, rhs, opt)
	if type(modes) == "string" then
		vim.api.nvim_set_keymap(modes, lhs, rhs, opt)
	else
		for _, mode in ipairs(modes) do
			vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
		end
	end
end


local opt = {noremap = true, silent = true}

map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<A-Right>", ":vsplit<CR>", opt)
map("n", "<CR>", "i", opt)
map("n", "<C-Down>", "yyp", opt)
map("n", "<C-x>", "dd", opt)
map("n", "<C-z>", "u", opt)
map("n", "<leader><leader>", ":Zsh<CR>", opt)
map("n", "<leader>r", ":Run<CR>", opt)
map("n", "<leader>c", ":lua require('myplugin').clipPath()<CR>", opt)


map("i", "<A-Down>", "<C-o>:m +1<CR>", opt)
map("i", "<A-Up>", "<C-o>:m .-2<CR>", opt)
map("i", "<C-Down>", "<c-o>yy<c-o>p", opt)
map("i", "<c-x>", "<c-o>dd", opt)
map("i", "<c-c>", "<c-o>yy", opt)
map("i", "<c-v>", "<c-o>p", opt)
map("i", "<C-z>", "<C-o>:undo<CR>", opt)
map("i", "<C-s>", "<Esc>:w<CR>", opt) 

map("v", "<C-c>", "y:lua require('myplugin').clip('\"')<CR>", opt)
map("v", "<C-v>", "p", opt)
-- map("v")
-- plugins keybind

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
map("n", "<leader>f", ":Telescope live_grep<CR>", opt)


-- Lsp
pluginKeys.mapLSP = function(mapbuf)
end

-- nvim-cmp
pluginKeys.cmp = function(cmp)
	return	{
	 ["<C-Down>"] = cmp.mapping.select_next_item(),
	 ["<C-Up>"] = cmp.mapping.select_prev_item(),
	 ["<CR>"] = cmp.mapping({
       i = function(fallback)
         if cmp.visible() and cmp.get_active_entry() then
           cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
         else
           fallback()
         end
       end,
       s = cmp.mapping.confirm({ select = true }),
       c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
     }),
	--['<CR>'] = cmp.mapping.complete(),
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

-- lsp
map('n', '<Leader>d', '<cmd>lua vim.diagnostic.virtual_text = (not vim.diagnostic.virtual_text)<CR>', { noremap = true, silent = true })


return pluginKeys
