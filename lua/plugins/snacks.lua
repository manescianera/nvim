-- snacks.nvim: fuzzy picker (files, grep, buffers, symbols, diagnostics, undo...).
-- It also replaces a few small plugins: notifier (messages), input, quickfile.

-- pick("files") -> a keymap action that opens that picker.
local function pick(name)
	return function()
		require("snacks").picker[name]()
	end
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true }, -- don't choke on huge files
		picker = { enabled = true },
		notifier = { enabled = true }, -- nicer :messages / vim.notify
		input = { enabled = true },
		quickfile = { enabled = true }, -- :e file without hitting "file is not found"
	},
	keys = {
		{ "<leader><space>", pick("smart"), desc = "Find files (smart)" },
		{ "<leader>,", pick("buffers"), desc = "Buffers" },
		{ "<leader>/", pick("grep"), desc = "Grep project" },
		{ "<leader>ff", pick("files"), desc = "Files" },
		{ "<leader>fg", pick("grep"), desc = "Grep" },
		{ "<leader>fw", pick("grep_word"), desc = "Grep word under cursor" },
		{ "<leader>fb", pick("buffers"), desc = "Buffers" },
		{ "<leader>fr", pick("recent"), desc = "Recent files" },
		{ "<leader>fd", pick("diagnostics"), desc = "Diagnostics" },
		{ "<leader>fs", pick("lsp_workspace_symbols"), desc = "Workspace symbols" },
		{ "<leader>fS", pick("lsp_symbols"), desc = "Document symbols" },
		{ "<leader>u", pick("undo"), desc = "Undo history" },
		{ "<leader>fl", pick("lines"), desc = "Lines in buffer" },
		{ "<leader>fh", pick("help"), desc = "Help" },
		{ "<leader>fk", pick("keymaps"), desc = "Keymaps" },
		{ "<leader>fn", pick("notifications"), desc = "Notifications" },
		{ "<leader>f.", pick("resume"), desc = "Resume last picker" },
	},
}
