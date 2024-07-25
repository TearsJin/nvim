local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify ("Can not find nvim-treesitter")
    return
end

treesitter.setup ({
  -- : TSInstallInfo 
  ensure_installed = { 
	"json", 
	"vim", 
	"lua", 
	"python"
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
