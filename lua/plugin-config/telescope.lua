local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("Can not find telescope")
	return
end


telescope.setup()


