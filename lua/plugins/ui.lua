-- Look & feel: colorscheme, icons, file explorer, centred writing mode.

return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000, -- load first so the colorscheme is available to lazy.nvim
		opts = {
			theme = "wave",
			overrides = function(colors)
				local p = colors.palette
				return {
					Normal = { bg = p.sumiInk0 }, -- one shade darker than default
					NormalFloat = { bg = p.sumiInk3 },
					SignColumn = { bg = p.sumiInk0 },
					LineNr = { bg = p.sumiInk0 },
					CursorLineNr = { bg = p.sumiInk0 },
				}
			end,
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
			vim.cmd.colorscheme("kanagawa")
		end,
	},

	{
		"nvim-mini/mini.icons",
		lazy = false,
		opts = {},
		-- Snacks/blink look for nvim-web-devicons; mini.icons can impersonate it,
		-- which saves installing a second icon plugin.
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return require("mini.icons")
			end
		end,
	},

	{
		"stevearc/oil.nvim", -- edit the filesystem like a buffer
		keys = { { "-", "<cmd>Oil --float<CR>", desc = "Open parent directory" } },
		opts = {
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
			view_options = { show_hidden = true },
			float = {
				padding = 2,
				border = "rounded",
				max_width = 0.6, -- 60% of the screen
				max_height = 0.6,
			},
			keymaps = {
				["q"] = { "actions.close", mode = "n" }, -- quit without reaching for <Esc>
			},
		},
	},

	{
		"shortcuts/no-neck-pain.nvim", -- centre the buffer, padding the sides
		version = "^3",
		keys = { { "<leader>nn", "<cmd>NoNeckPain<CR>", desc = "Toggle centred writing" } },
		opts = {
			width = 120,
			autocmds = { skipEnteringNoNeckPainBuffer = true },
			buffers = { scratchPad = { enabled = true } },
			integrations = {
				NvimDAPUI = { position = "right", reopen = true },
			},
		},
	},
}
