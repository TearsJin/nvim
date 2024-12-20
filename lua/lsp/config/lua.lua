local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local opts = {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
		python = {
			analysis = {
				disabled = {"E501"},
			}
		},
	},


	flags = {
		debounce_text_changes = 150,
	},

	on_attach = function(client, bufnr)
		client.capabilities.document_formatting = false
		client.capabilities.document_range_formatting = false

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		require("keybindings").mapLSP(buf_set_keymap)

		-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end,
}

return{
	on_setup = function(server)
		server.setup(opts)
	end,
}
