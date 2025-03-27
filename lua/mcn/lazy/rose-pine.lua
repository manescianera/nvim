return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					migrations = true,
				},

				styles = {
					bold = true,
					italic = false,
				},

				groups = {
					border = "surface",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				vim.cmd.colorscheme("rose-pine-main"),
				-- main
				vim.cmd.highlight("WinSeparator guibg=#191724 guifg=#1f1d2e"),
				-- moon
				-- vim.cmd.highlight("WinSeparator guibg=#232136 guifg=#2a273f"),
			})
		end,
	},
}
