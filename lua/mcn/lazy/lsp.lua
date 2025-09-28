-- LSP support (not sure if I need this)
return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		-- lspconfig.biome.setup({
		-- 	cmd = { "biome", "lsp-proxy" },
		-- 	filetypes = { "javascript", "typescript", "json", "javascriptreact", "typescriptreact", "jsonc" },
		-- 	root_dir = lspconfig.util.root_pattern("biome.json", "package.json", ".git"),
		-- 	on_attach = function(client, bufnr)
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
		-- 			buffer = bufnr,
		-- 			callback = function()
		-- 				vim.lsp.buf.format({
		-- 					bufnr = bufnr,
		-- 					filter = function(c)
		-- 						return c.name == "biome"
		-- 					end,
		-- 				})
		-- 				vim.lsp.buf.code_action({
		-- 					bufnr = bufnr,
		-- 					context = {
		-- 						only = { "source.fixAll" },
		-- 						diagnostics = {},
		-- 					},
		-- 					apply = true,
		-- 				})
		-- 			end,
		-- 		})
		-- 	end,
		-- })
	end,
}
