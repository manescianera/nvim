return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({
			defaults = {
				preview = false,
				layout_strategy = "horizontal",
				layout_config = {
					width = 80,
					height = 0.4,
				},
				file_ignore_patterns = {
					"vendor/",
					"%.git/",
					"%.cache/",
					"__pycache__/",
					".mypy_cache/",
					".venv/",
					"venv/",
					"node_modules/",
					"build/",
					"target/",
					"%.o",
					"%.a",
					"%.so",
					"%.dll",
					"%.class",
					"%.jar",
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
}
