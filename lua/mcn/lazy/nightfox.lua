return {
	"EdenEast/nightfox.nvim",
	dependencies = {
		"folke/snacks.nvim",
	},
	config = function()
		require("nightfox").setup({
			options = {
				styles = {
					comments = "italic",
					keywords = "bold",
					strings = "italic",
				},
			},
		})

		-- vim.cmd.colorscheme("nightfox")
	end,
}
