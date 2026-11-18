-- Global keymaps. Picker keys live next to snacks in plugins/snacks.lua,
-- LSP/debug keys live next to theirs, so this file stays about plain editing.

local map = vim.keymap.set

-- Move the selected lines up/down, keeping the selection.
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- J joins the line below without moving the cursor.
map("n", "J", "mzJ`z", { desc = "Join line below" })

-- Half-page jumps and searches stay centred.
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
map("n", "n", "nzzzv", { desc = "Next match" })
map("n", "N", "Nzzzv", { desc = "Previous match" })
map("n", "G", "Gzz", { desc = "End of file" })

-- Helix-style line ends.
map({ "n", "v" }, "gl", "$", { desc = "End of line" })
map({ "n", "v" }, "gh", "_", { desc = "Start of line" })

-- Clipboard: yank/delete go to the system clipboard explicitly.
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
map("x", "<leader>p", '"_dP', { desc = "Paste over selection, keep register" })

map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "Q", "<nop>", { desc = "Disable ex mode" })

-- Replace the word under the cursor in the whole file.
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word in file" })

-- Diagnostics: ]d / [d are native, this just shows the full message.
map("n", "<C-e>", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Windows: navigate with Ctrl, resize with native <C-w>>/<C-w>+/<C-w>=
for _, win in ipairs({ { "h", "left" }, { "j", "down" }, { "k", "up" }, { "l", "right" } }) do
	map("n", "<C-" .. win[1] .. ">", "<C-w>" .. win[1], { desc = "Go to window " .. win[2] })
end

-- Language tooling.
map("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- Go helpers (fine to keep global: they only make sense in Go files).
map("n", "<leader>er", "oif err != nil {<CR>}<Esc>O", { desc = "Go: if err != nil" })
map("n", "<leader>go", "<cmd>!go run *.go<CR>", { desc = "Go: run" })
map("n", "<leader>mod", "<cmd>!go mod tidy && go mod vendor<CR>", { desc = "Go: mod tidy + vendor" })
