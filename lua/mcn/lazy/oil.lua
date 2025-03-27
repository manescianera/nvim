return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("oil").setup({
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 3,
				max_width = 1,
				border = "rounded",
				preview_split = "below",
				override = function(conf)
					local width = 80
					local height = 24
					local screen_width = vim.o.columns
					local screen_height = vim.o.lines
					local col = math.floor((screen_width - width) / 2)
					local row = math.floor((screen_height - height) / 2)

					conf.width = width
					conf.height = height
					conf.col = col
					conf.row = row

					-- vim.api.nvim_create_autocmd("BufEnter", {
					-- 	buffer = conf.bufnr,
					-- 	callback = function()
					-- 		vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", {
					-- 			buffer = conf.bufnr,
					-- 			silent = true,
					-- 		})
					-- 	end,
					-- })
					--
					return conf
				end,
			},
		})
		vim.keymap.set("n", "-", "<cmd>Oil --float<CR>")
	end,
}
