local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	"lua_ls",
	"ts_ls",
	"jsonls",
	"gopls",
	"bashls",
}

for _, server in ipairs(servers) do
	local ok, config = pcall(require, "servers." .. server)
	if ok and type(config) == "function" then
		config(capabilities)
	else
		vim.notify("LSP config not found for " .. server, vim.log.levels.WARN)
	end
end

vim.lsp.enable(servers)
