return {
	"stevearc/conform.nvim",
	opts = {},

	config = function()
		local function get_node_path()
			local handle = io.popen("source ~/.nvm/nvm.sh && which node 2>/dev/null")
			if handle then
				local result = handle:read("*a")
				handle:close()
				if result and result ~= "" then
					return result:gsub("\n", ""):match("(.+)/[^/]+$")
				end
			end

			vim.notify("Could not find node path", vim.log.levels.ERROR)

			return nil
		end

		local node_path = get_node_path()

		if not node_path then
			vim.notify("Skipping prettier setup due to missing Node.js", vim.log.levels.WARN)
			return
		end

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

			formatters = {
				prettier = {
					env = {
						PATH = node_path .. ":" .. (vim.env.PATH or ""),
					},
				},
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
