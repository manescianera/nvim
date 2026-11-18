-- Language support: LSP servers, formatter, completion.
-- Neovim 0.11+ style: servers are enabled with vim.lsp.enable(), no lspconfig.setup().

-- Custom options for individual servers.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			-- treat the nvim runtime as the library, so `vim.*` is not "undefined"
			workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})

local function format_buffer()
	require("conform").format({ async = true, lsp_format = "fallback" })
end

-- Diagnostics: sorted by severity, rounded popup, inline virtual text.
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = { border = "rounded", source = true },
	virtual_text = { current_line = true },
})

-- Buffer-local LSP keys (K, grn, gra, grr, gri, grd already exist natively).
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.keymap.set("n", "<leader>th", function()
			local on = not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf })
			vim.lsp.inlay_hint.enable(on, { bufnr = args.buf })
		end, { buffer = args.buf, desc = "Toggle inlay hints" })
	end,
})

-- Servers we actually want running.
local servers = { "lua_ls", "gopls", "pyright", "ruff", "ts_ls", "jsonls", "templ" }

return {
	{
		"mason-org/mason.nvim", -- installs/manages the external tools below
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = servers,
			-- Explicit allowlist: formatters installed by mason (e.g. stylua) also map to
			-- LSP servers, and we don't want them running as language clients.
			-- Rust is handled by rustaceanvim.
			automatic_enable = servers,
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- formatters (servers come from mason-lspconfig)
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = { "rustfmt", "gofumpt", "goimports", "ruff", "prettier", "shfmt", "stylua" },
			run_on_start = true,
		},
	},

	{ "neovim/nvim-lspconfig", dependencies = { "mason-org/mason-lspconfig.nvim" } },

	{
		"mrcjkb/rustaceanvim", -- rust-analyzer with sane defaults, fully replaces lspconfig's
		version = "^9",
		lazy = false, -- already lazy internally
	},

	{
		"stevearc/conform.nvim", -- format on save + <leader>F
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				go = { "goimports", "gofumpt" }, -- imports first, then gofumpt fixes formatting
				rust = { "rustfmt" },
				python = { "ruff" },
				lua = { "stylua" },
				sh = { "shfmt" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = { timeout_ms = 700, lsp_format = "fallback" },
		},
		keys = {
			{ "<leader>F", format_buffer, desc = "Format buffer" },
		},
	},

	{
		"saghen/blink.cmp", -- completion engine
		version = "1.*",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = { preset = "default" }, -- <C-y> accept, <C-n>/<C-p> select, <C-e> hide
			appearance = { nerd_font_variant = "mono" },
			completion = { documentation = { auto_show = false } },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "prefer_rust" }, -- prebuilt binary, no nightly needed
		},
		opts_extend = { "sources.default" },
	},
}
