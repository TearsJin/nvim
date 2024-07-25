local status, winpick = pcall(require, "winpick")
if not status then
	vim.notify("Can not find winpick")
	return
end

winpick.setup({
	border = "double",
	filter = nil, -- doesn't ignore any window by default
	prompt = "Pick a window: ",
	format_label = winpick.defaults.format_label, -- formatted as "<label>: <buffer name>"
	chars = {"1","2","3"},
})
