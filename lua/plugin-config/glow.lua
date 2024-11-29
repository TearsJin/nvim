local status, glow = pcall(require, "glow")

if not status then
	vim.notify("Can not find glow")
	return
end


glow.setup({
	-- glow_path = "",
	-- install_path = "",
	border = "single",
	style = "light",
	pager = false,
	width = 120,
	height = 100,
	width_ratio = 0.7,
	height_ratio = 0.7,
})

