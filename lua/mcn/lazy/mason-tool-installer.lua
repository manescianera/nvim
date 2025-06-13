return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {},

	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Language Servers
				"lua_ls",
				"gopls",
				"pyright",
				"ts_ls",
				"templ",

				-- Formatters
				"gofumpt",
				"goimports",
				"ruff",
				"biome",
				"prettier",
				"shfmt",
				"stylua",

				-- Linters
				"golangci-lint",
				"eslint",
				"shellcheck",
				"luacheck",
			},
			run_on_start = true,
			integrations = {
				["mason-lspconfig"] = true,
			},
		})
	end,
}
