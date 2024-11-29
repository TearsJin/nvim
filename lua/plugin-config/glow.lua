local status, glow = pcall(require, "glow")

if not status then
	vim.notify("Can not find glow")
	return
end


glow.setup({
	-- glow_path = "",
	-- install_path = "~/.local/bin",
	border = "single",
	pager = false,
	width = 150,
	height = 100,
	width_ratio = 0.7,
	height_ratio = 0.7,
})

