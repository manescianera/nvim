-- reads the file when it is changed
return {
	"djoshea/vim-autoread",
	lazy = false,
	config = function()
		vim.cmd("set autoread")
	end,
}
