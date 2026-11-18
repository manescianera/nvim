-- Editing helpers: syntax highlighting, git signs, misc filetypes.
-- Note: `gcc` / `gc{motion}` commenting is built into Neovim 0.10+, so no plugin.

-- In visual mode these actions receive the selected line range; in normal mode
-- they fall back to the hunk under the cursor.
local function visual_range()
	local first, last = vim.fn.line("v"), vim.fn.line(".")
	if first > 0 and first ~= last then
		return { math.min(first, last), math.max(first, last) }
	end
end

-- Small wrappers so the keymap table below stays one line per key.
local function gs(fn)
	return function()
		require("gitsigns")[fn]()
	end
end

local function gs_range(fn)
	return function()
		require("gitsigns")[fn](visual_range())
	end
end

local function gs_nav(dir)
	return function()
		require("gitsigns").nav_hunk(dir)
	end
end

return {
	{
		"windwp/nvim-autopairs", -- closes brackets/quotes while typing
		event = "InsertEnter",
		opts = {},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main", -- 0.12 rewrite; needs the `tree-sitter` CLI (brew install tree-sitter)
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup()
			require("nvim-treesitter").install({
				"vimdoc",
				"go",
				"python",
				"rust",
				"lua",
				"sql",
				"markdown",
				"markdown_inline",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"toml",
				"yaml",
				"templ",
			})

			-- The main branch does not enable highlighting by itself; do it per buffer
			-- (pcall because buffers without a parser are fine).
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim", -- hunk signs in the gutter + hunk actions
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		keys = {
			{ "]c", gs_nav("next"), desc = "Next git hunk" },
			{ "[c", gs_nav("prev"), desc = "Previous git hunk" },
			{ "<leader>hs", gs_range("stage_hunk"), mode = { "n", "v" }, desc = "Stage hunk" },
			{ "<leader>hr", gs_range("reset_hunk"), mode = { "n", "v" }, desc = "Reset hunk" },
			{ "<leader>hp", gs("preview_hunk"), desc = "Preview hunk" },
			{ "<leader>hb", gs("blame_line"), desc = "Blame line" },
			{ "<leader>hd", gs("diffthis"), desc = "Diff this file" },
			{ "<leader>hq", gs("setqflist"), desc = "Hunks to quickfix" },
			{ "<leader>ht", gs("toggle_current_line_blame"), desc = "Toggle line blame" },
			{ "ih", gs("select_hunk"), mode = { "o", "x" }, desc = "Select hunk" },
		},
	},

	{ "terrastruct/d2-vim", ft = "d2" }, -- D2 diagram syntax
}
