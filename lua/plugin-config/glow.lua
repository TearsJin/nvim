local status, glow = pcall(require, "glow")

if not status then
	vim.notify("Can not find glow")
	return
end


glow.setup({
	-- glow_path = "/bin",
	-- install_path = "~/.local/bin",
	border = "single",
	style = "dark",
	pager = false,
	width = 80,
	height = 100,
	width_ratio = 0.7,
	height_ratio = 0.7,
})
