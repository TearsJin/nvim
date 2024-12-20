local packer = require("packer")
packer.startup({
	function(use)
		use 'wbthomason/packer.nvim'
	------------------------------------ colorschemes ---------------------------------------------
	-- tokyonight
		use 'folke/tokyonight.nvim'
	--------------------------------------------------------------------------------------------------
	-- nvim-tree
		use({'kyazdani42/nvim-tree.lua', requires = "kyazdani42/nvim-web-devicons"})
	-- bufferline
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
	-- window-picker
		use 'gbrlsnchs/winpick.nvim'
	-- lualine
		use({"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons"}})
		use 'arkav/lualine-lsp-progress'
	-- telescope
		use({"nvim-telescope/telescope.nvim",requires = {"nvim-lua/plenary.nvim","nvim-treesitter/nvim-treesitter"}})
	-- dashboard
		use {"glepnir/dashboard-nvim", requires = "nvim-tree/nvim-web-devicons"}
		-- use "mhinz/vim-startify"
		-- project
		use "ahmedkhalf/project.nvim"
	-- treesitter
		use {"nvim-treesitter/nvim-treesitter", run = ": TSUpdate"}
	-- lsp
		use "williamboman/mason.nvim"
		use "williamboman/mason-lspconfig.nvim"
		use "neovim/nvim-lspconfig"
	-- nvim-cmp
		use "hrsh7th/nvim-cmp"
		use "hrsh7th/vim-vsnip"
	-- cmp sourece
		use "hrsh7th/cmp-vsnip"
		use "hrsh7th/cmp-nvim-lsp"
		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-path"
		use "hrsh7th/cmp-cmdline"
		use "rafamadriz/friendly-snippets"
		use "onsails/lspkind-nvim"
		-- use "honza/vim-snippets"
	-- nvim-comment
		use "numToStr/Comment.nvim"
	-- spectre
	--	use "nvim-lua/plenary"
	--  use "nvim-pack/spectre"
	-- glow
		use "ellisonleao/glow.nvim"
	-- indent-blcnkline
		use "lukas-reineke/indent-blankline.nvim"
	-- latex
		use "lervag/vimtex"
	-- notify
		use 'rcarriga/nvim-notify'
	end
})

pcall(
	vim.cmd,
	[[
		augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
		augroup end
	]]
)


