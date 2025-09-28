-- easily install and manage LSP servers, DAP servers, linters, and formatters.
return {
	"mason-org/mason.nvim",
	opts = {},

	config = function()
		require("mason").setup()
	end,
}
