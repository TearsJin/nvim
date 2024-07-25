local status, comment = pcall(require, "Comment")

if not status then
	vim.notify("Can not find Comment")
	return
end

local default_opts = {
	padding = true,
	sticky = true,
	ignore = nil,
	mappings = false,
	pre_hook = nil,
	post_hook = nil
}

comment.setup(vim.tbl_deep_extend("force",default_opts,require("keybindings").comment))
