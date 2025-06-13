return {
	"stevearc/conform.nvim",
	opts = {},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "gofumpt", "goimports" },
				python = "ruff",
				lua = { "stylua", "luacheck" },

				javascript = { "biome", "eslint" },
				typescript = { "biome", "eslint" },
				json = { "biome", "eslint" },
				html = { "prettier", "eslint" },
				css = { "prettier", "eslint" },

				yaml = { "prettier", "eslint" },
				markdown = { "prettier", "eslint" },
				sh = { "shfmt", "shellcheck" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
