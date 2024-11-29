local status, nvim_notify = pcall(require, "notify")

if not status then
	vim.notify("Can not find nvim-notify")
	return
end

vim.notify = nvim_notify


