vim.g.tex_flavor = "latex"
-- vim.cmd('syntax enable')


if vim.fn.has("win32") == 1 or (vim.fn.has("unix") == 1) and vim.fn.getenv("WSLENV") ~= nil then
	vim.g.vimtex_compiler_method = "latexmk"
	vim.g.vimtex_compiler_latexmk = {
		options = {
			'-pdf',
			'-shell-escape',
			'-auxdir=temp/',
			'-output-directory=./',
			'-synctex=1',
			'-file-line-error'
		}
	}
	vim.g.vimtex_view_method = "sioyek"
	vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
	vim.g.vimtex_view_callback_progpath = "wsl nvim"
	vim.g.vimtex_compiler_progname = "nvr"
	vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
end

pcall(
	vim.cmd,
	[[
		augroup vimtex_user_config
		autocmd!
		autocmd BufWritePost *.tex silent! VimtexCompile
		augroup end
	]]
)


