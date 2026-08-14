-- Keybindings
local map = vim.keymap.set
vim.g.mapleader = " "

-- Quick esc
map("i", "<C-j>", "<Esc>")
map("t", "<C-j>", "<C-\\><C-N>")
map("t", "<Esc>", "<C-\\><C-N>")

-- Navigation
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>sv", ":vsplit<CR>")
map("n", "<leader>sh", ":split<CR>")
map("n", "<leader>t", ":belowright split<CR>:resize 15<CR>:terminal<CR>i")
map("n", "<leader>x", ":close<CR>")
map("n", "<leader>w", ":bd<CR>")
map("n", "<leader><tab>", ":tabedit<CR>")
map("n", "<tab>", ":tabnext<CR>")
map("n", "<S-tab>", ":tabprev<CR>")
map("n", "<C-down>", ":resize -5<CR>", { desc = "Resize horizontal split down" })
map("n", "<C-up>", ":resize +5<CR>", { desc = "Resize horizontal split up" })
map("n", "<C-left>", ":vertical resize -5<CR>", { desc = "Resize vertical split left" })
map("n", "<C-right>", ":vertical resize +5<CR>", { desc = "Resize vertical split right" })
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<C-k>", "kzz")
map("n", "<C-j>", "jzz")
map({ "n", "v", "x" }, "<leader>y", "\"+y<CR>", { desc = "Yank selection to system clipboard" })
map({ "v", "x" }, "<leader>d", "\"+d<CR>", { desc = "Cut selection to system clipboard" })
map("n", "<leader>cwd", ":cd %:p:h<CR>")


-- Plugins
map("n", "<leader>bf", vim.lsp.buf.format)
map("n", "<leader>ff", ":Pick files<CR>", { desc = "Open mini picker file finder" })
map("n", "<leader>fh", ":Pick help<CR>", { desc = "Open mini picker help menu" })
map("n", "<leader>fg", ":Pick grep_live<CR>", { desc = "Open mini picker live grep" })
map("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Open mini picker buffers" })
map("n", "<leader>e", ":Oil<CR>", { desc = "Open oil file explorer" })
map("n", "<leader>d", require("mini.diff").toggle_overlay, { desc = "Show git diffs"} )
map("n", "<leader>cs", ":Themify<CR>", { desc = "Open Themify menu" })
