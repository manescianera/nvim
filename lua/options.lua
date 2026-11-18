-- Editor options and small autocommands. Loaded before any plugin.

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes" -- always reserve the gutter, so signs never shift text
opt.fillchars = { eob = " " } -- hide the "~" below the last line
opt.termguicolors = true
opt.winborder = "rounded" -- rounded borders on every floating window
opt.laststatus = 3 -- single global statusline
opt.scrolloff = 8
opt.jumpoptions = "view" -- keep the cursor centred on jumps
opt.mouse = "" -- keyboard only

-- Indent: 4 spaces by default; 2 for web/json/yaml (see FileType below)
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true -- case-sensitive as soon as the pattern has a capital
opt.hlsearch = true
opt.incsearch = true

-- Files and undo history
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"
opt.confirm = true -- :q offers to save instead of erroring
opt.autoread = true -- reload files changed on disk

-- Editing
opt.updatetime = 100 -- snappier gitsigns/diagnostics
opt.textwidth = 80
opt.splitright = true -- :vsplit opens to the right
opt.splitbelow = true -- :split opens below
opt.isfname:append("@-@") -- allow @ in filenames (gf, :find)

-- Silence providers we don't use (no perl/ruby plugins here).
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.fn.mkdir(vim.fn.stdpath("state") .. "/undo", "p")

-- .templ files are Go templates; neovim doesn't know the extension.
vim.filetype.add({ extension = { templ = "templ" } })

-- 2-space indentation for data and web files.
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"json",
		"jsonc",
		"yaml",
		"css",
		"scss",
		"html",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- Pick up external changes when coming back to nvim (replaces vim-autoread).
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	command = "checktime",
})

-- Restore the cursor to the last position when reopening a file.
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
