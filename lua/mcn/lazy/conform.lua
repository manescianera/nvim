return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "gofmt", "goimports" },
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				ruby = { "rubocop" },
				kotlin = { "ktlint", "ktfmt" },
				-- yaml = { "yamlfmt" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
		})
	end,
}
