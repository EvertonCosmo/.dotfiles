vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	root_markers = { ".git" },
})

local servers = {
	"lua_ls",
	"tsc",
	"jsonls",
	"gopls",
	"bashls",
	"clangd",
	"neocmakelsp",
	"make_ls",
	"yamlls",
	"docker_language_server",
	"prismals",
	"terraformls",
	"tailwindcss",
	"pylsp",
	-- kotlin_lsp is started by kotlin.nvim 
}

for _, server in ipairs(servers) do
	local ok, config = pcall(require, "servers." .. server)
	if ok and type(config) == "function" then
		config()
	else
		vim.notify("LSP config not found for " .. server, vim.log.levels.WARN)
	end
end

vim.lsp.enable(servers)
