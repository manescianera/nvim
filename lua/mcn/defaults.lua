vim.env.PATH = "/Users/mcn/.nvm/versions/node/v24.2.0/bin:" .. (vim.env.PATH or "")

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local last_line = vim.fn.line("'\"")
		if last_line > 0 and last_line <= vim.fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
})
