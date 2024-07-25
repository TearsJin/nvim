local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("Can not find bufferline")
	return
end

-- bufferline config
bufferline.setup({
	options = {
	  close_command = "Bdelete! %d",
	  right_mouse_command = "Bdelete! %d",

	  offsets = {
		{
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left",
		},
	  },

	  diagnostics = "nvim_lsp",
	}
})
