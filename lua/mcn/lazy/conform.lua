return {
	"stevearc/conform.nvim",
	opts = {},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "gofumpt", "goimports" },
				python = { "ruff" },
				lua = { "stylua" },
				sh = { "shfmt" },

				javascript = { "biome" },
				typescript = { "biome" },
				json = { "biome" },
				html = { "prettier" },
				css = { "prettier" },

				yaml = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
