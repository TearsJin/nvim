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


function print_table(t)
    for k, v in pairs(t) do
        if type(v) == "table" then
            print(k, "=>")
            print_table(v)
        else
            print(k, "=", v)
        end
    end
end


-- print_table(vim.tbl_deep_extend("force",default_opts,require("keybindings").comment))
comment.setup(vim.tbl_deep_extend("force",default_opts,require("keybindings").comment))
