
-- debug
local ondebug = function(opt)
	local filename = vim.api.nvim_buf_get_name(0)
	local index = -1
	local suffix = ""
	local interpreter = ""
	while (index > -10) do
		suffix = string.sub(filename, index)
		if string.sub(suffix, 1, 1) == "." then break end
		index = index - 1
	end
	if suffix == ".py" then
		interpreter = "nohup python3 "
	elseif suffix == ".lua" then
		interpreter = "nohup lua "
	end

	local shellcmd = interpreter .. filename .. "> /tmp/nvim.Aelita/fordebug"
	os.execute(shellcmd)

	local file = io.open("/tmp/nvim.Aelita/fordebug", "r")
	local result = file:read("*a")
	file:close()

    local lines = {}
    for line in result:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

	os.remove("/tmp/nvim.Aelita/fordebug")
	--local result = handle:read("*a")
	--handle:close()
	-- vim.notify(result)
	-- show_floating_window({ "Hello, Neovim!"})

	-- show_floating_window({result})
	show_floating_window(lines)
end

vim.api.nvim_create_user_command(
	"Run",
	ondebug,
	{}
)

vim.api.nvim_create_user_command(
	"Zsh",
	function ()
		vim.cmd("vsplit term://zsh")
	end,
	{}
)
------------------------
-- 定义一个函数来创建浮动窗口并显示内容
function show_floating_window(content)
  -- 获取当前 Neovim 窗口的宽度和高度
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")

  -- 定义浮动窗口的宽度和高度
  local win_width = math.ceil(width * 0.6)
  local win_height = math.ceil(height * 0.4)

  -- 定义浮动窗口的起始位置
  local row = math.ceil((height - win_height) / 2)
  local col = math.ceil((width - win_width) / 2)

  -- 创建一个缓冲区用于浮动窗口
  local buf = vim.api.nvim_create_buf(false, true)

  -- 设置缓冲区的内容
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

  -- 创建浮动窗口
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'single'
  })
end

return{
	clip = function(reg)
	Content = string.gsub(vim.fn.getreg(reg), '\"', '\\"')
	os.execute("echo \"" .. Content .. "\"|" .. "clip.exe")
end,
	clipPath = function()
		os.execute("echo \"" .. vim.api.nvim_buf_get_name(0) .. "\"|" .. "clip.exe")
end,
}
