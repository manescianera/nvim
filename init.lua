-- Entry point: leader keys, plain Vim setup, then lazy.nvim.

-- Leader keys must exist before plugins register their mappings.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")

-- Bootstrap lazy.nvim, then load everything under lua/plugins/ as a plugin spec.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	local args = { "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath }
	vim.fn.system(args)

	if vim.v.shell_error ~= 0 then
		-- Servers whose git config rewrites github https URLs to ssh (no GitHub key)
		-- can only clone with the user config ignored.
		vim.fn.system({ "env", "GIT_CONFIG_GLOBAL=/dev/null", "GIT_CONFIG_SYSTEM=/dev/null", unpack(args) })
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = { import = "plugins" },
	install = { colorscheme = { "kanagawa" } },
	change_detection = { notify = false },
	rocks = { enabled = false }, -- no plugin here needs luarocks
})
