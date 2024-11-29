local status, mason = pcall(require, "mason")
if not status then
	vim.notify("Can not find mason")
	return
end

local status, mason_config = pcall(require,"mason-lspconfig")
if not status then
	vim.notify("Can not find mason-lspconfig")
	return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("Can not find lspconfig")
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "->",
			package_uninstalled = "✗",
		}
	},
})

mason_config.setup({
	ensure_installed = {
		"lua_ls",
		"pylsp",
		"texlab"
  },
})

-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	lua_ls = require("lsp.config.lua"),
	pylsp = require("lsp.config.lua"),
	texlab = require("lsp.config.lua")
}


for name, config in pairs (servers) do
  if config ~= nil and type(config) == "table" then
	config.on_setup(lspconfig[name])
  else
	lspconfig[name].setup({})
  end
end

-- require("lsp.ui")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			severity = { min = vim.diagnostic.severity.ERROR}
		},
	}
)
