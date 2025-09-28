-- undo history
return {
	"mbbill/undotree",

	config = function()
		vim.g.undotree_WindowLayout = 1
		vim.g.undotree_SplitWidth = 60
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}
