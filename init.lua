-- Entry point: leader keys, plain Vim setup, then lazy.nvim.

-- Leader keys must exist before plugins register their mappings.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")

-- Bootstrap lazy.nvim, then load everything under lua/plugins/ as a plugin spec.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = { import = "plugins" },
	install = { colorscheme = { "kanagawa" } },
	change_detection = { notify = false },
	rocks = { enabled = false }, -- no plugin here needs luarocks
})
