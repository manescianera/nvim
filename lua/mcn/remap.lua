vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up in visual mode

vim.keymap.set("n", "J", "mzJ`z") -- move next line to current line
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- go down and center
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- go up and center
vim.keymap.set("n", "n", "nzzzv") -- find next and center
vim.keymap.set("n", "N", "Nzzzv") -- find previous and center
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>") -- restart LSP

vim.keymap.set("x", "<leader>p", [["_dP]]) -- pastes over the selected text without changing the yank buffer

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy line to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete to system clipboard

vim.keymap.set("n", "Q", "<nop>") -- disables default Q keybinding
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_next) -- go to next diagnostic
vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_prev) -- go to previous diagnostic

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- search and replace

-- Go stuff
vim.keymap.set("n", "<leader>er", "oif err != nil {<CR>}<Esc>O") -- Go: if err != nil { ... }
vim.keymap.set("n", "<leader>go", "<cmd>!go run *.go<CR>")
vim.keymap.set("n", "<leader>mod", "<cmd>!go mod tidy && go mod vendor<CR>")

vim.keymap.set("n", "<C-e>", function()
	vim.diagnostic.open_float()
end)

vim.keymap.set("n", "<leader>r", function()
	vim.lsp.buf.rename()
end)

vim.keymap.set("n", "<leader>F", "<cmd>lua FzfLua.live_grep()<CR>")

-- use leader+[hjkl] to select the active split
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- use ctrl+[hjkl] to resize the active split
vim.keymap.set("n", "<leader>h", "<CMD>vertical resize -5<CR>")
-- vim.keymap.set("n", "<C-j>", "<CMD>horizontal resize +5<CR>")
-- vim.keymap.set("n", "<C-k>", "<CMD>horizontal resize -5<CR>")
vim.keymap.set("n", "<leader>l", "<CMD>vertical resize +5<CR>")

-- use leader+[HJKL] to move the active split
vim.keymap.set("n", "<leader>H", "<CMD>vertical resize +5<CR>")
vim.keymap.set("n", "<leader>J", "<CMD>vertical resize -5<CR>")
vim.keymap.set("n", "<leader>K", "<CMD>horizontal resize +5<CR>")
vim.keymap.set("n", "<leader>L", "<CMD>horizontal resize -5<CR>")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>nnp", "<CMD>NoNeckPain<CR>")

-- more comfortable
vim.keymap.set("n", "U", "<C-r>") -- redo

-- inspired by helix
vim.keymap.set("n", "gl", "$") -- end of line
vim.keymap.set("n", "gh", "_") -- beginning of line
vim.keymap.set("v", "gl", "$") -- end of line
vim.keymap.set("v", "gh", "_") -- beginning of line

-- fzf lua
vim.keymap.set("n", "gd", "<cmd>lua FzfLua.lsp_definitions()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gD", "<cmd>lua FzfLua.lsp_declarations()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gr", "<cmd>lua FzfLua.lsp_references()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<cmd>lua FzfLua.lsp_implementations()<CR>", { noremap = true, silent = true })
