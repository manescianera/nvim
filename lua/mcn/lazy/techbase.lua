return {
	"mcauley-penney/techbase.nvim",
	opts = {
		hl_overrides = function()
			local palette = require("techbase.palettes.techbase")

			return {
				["@property"] = { fg = palette.keyword },
				["@keyword"] = { fg = palette.info },
				["@function.method.call"] = { fg = palette.important },
			}
		end,
	},
	config = function(_, opts)
		require("techbase").setup(opts)
	end,
	priority = 1000,
}
