vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up in visual mode

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy line to system clipboard

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete to system clipboard

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>er", "oif err != nil {<CR>}<Esc>O")

vim.keymap.set("n", "<leader>go", "<cmd>!go run *.go<CR>")
vim.keymap.set("n", "<leader>mod", "<cmd>!go mod tidy && go mod vendor<CR>")

vim.keymap.set("n", "<C-e>", function()
	vim.diagnostic.open_float()
end)

vim.keymap.set("n", "<leader>r", function()
	vim.lsp.buf.rename()
end)

-- use leader+[hjkl] to select the active split
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- use ctrl+[hjkl] to resize the active split
vim.keymap.set("n", "<C-h>", "<CMD>vertical resize -5<CR>")
vim.keymap.set("n", "<C-j>", "<CMD>horizontal resize +5<CR>")
vim.keymap.set("n", "<C-k>", "<CMD>horizontal resize -5<CR>")
vim.keymap.set("n", "<C-l>", "<CMD>vertical resize +5<CR>")

-- use leader+[HJKL] to move the active split
vim.keymap.set("n", "<leader>H", "<CMD>vertical resize +5<CR>")
vim.keymap.set("n", "<leader>J", "<CMD>vertical resize -5<CR>")
vim.keymap.set("n", "<leader>K", "<CMD>horizontal resize +5<CR>")
vim.keymap.set("n", "<leader>L", "<CMD>horizontal resize -5<CR>")

-- crazy stuff
-- vim.keymap.set("i", "'", "''<Left>")
-- vim.keymap.set("i", "\"", "\"\"<Left>")
-- vim.keymap.set("i", "(", "()<Left>")
-- vim.keymap.set("i", "{", "{}<Left>")
-- vim.keymap.set("i", "[", "[]<Left>")
--
-- ruby stuff
-- arrays
-- vim.keymap.set("n", "<leader>w", "i%w[]<Left>")
-- vim.keymap.set("n", "<leader>i", "i%i[]<Left>")
-- vim.keymap.set("n", "<leader>aw", "a<Space>%w[]<Left>")
-- vim.keymap.set("n", "<leader>ai", "a<Space>%i[]<Left>")
-- string interpolation
vim.keymap.set({ "n" }, "<leader>#", "i#{}<Left>")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>nnp", "<CMD>NoNeckPain<CR>")
