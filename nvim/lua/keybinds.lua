-- Keybindings
local map = vim.keymap.set
vim.g.mapleader = " "

-- Quick esc
map("i", "<C-j>", "<Esc>", { desc = "Alternative escape from normal mode" })
map("t", "<C-j>", "<C-\\><C-N>", { desc = "Alternative escape from terminal mode" })
map("t", "<Esc>", "<C-\\><C-N>", { desc = "Escape from terminal mode" })

-- Navigation
map("n", "<leader>v", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>h", ":split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>x", ":close<CR>", { desc = "Close buffer" })
map("n", "<leader>w", ":bd<CR>", { desc = "Delete buffer" })
map("n", "<leader><tab>", ":tabedit<CR>", { desc = "Open new tab" })
map("n", "<tab>", ":tabnext<CR>", { desc = "Cycle to next tab" })
map("n", "<S-tab>", ":tabprev<CR>", { desc = "Cycle to previous tab" })
map("n", "<C-down>", ":resize -5<CR>", { desc = "Resize horizontal split down" })
map("n", "<C-up>", ":resize +5<CR>", { desc = "Resize horizontal split up" })
map("n", "<C-left>", ":vertical resize -5<CR>", { desc = "Resize vertical split left" })
map("n", "<C-right>", ":vertical resize +5<CR>", { desc = "Resize vertical split right" })
map({ "n", "v", "x" }, "<leader>y", "\"+y<CR>", { desc = "Yank selection to system clipboard" })
map({ "v", "x" }, "<leader>d", "\"+d<CR>", { desc = "Cut selection to system clipboard" })
map("n", "<leader>cwd", ":cd %:p:h<CR>", { desc = "Change working directory to current buffer" })

-- Navigation: Stay in visual mode after indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Navigation: Center window with scroll
map("n", "<C-k>", "kzz")
map("n", "<C-j>", "jzz")

-- Navigation: Tmux panes and nvim windows
vim.g.tmux_navigator_no_mappings = 1

map("n", "<M-h>", ":TmuxNavigateLeft<CR>", { noremap = true, silent = true })
map("n", "<M-j>", ":TmuxNavigateDown<CR>", { noremap = true, silent = true })
map("n", "<M-k>", ":TmuxNavigateUp<CR>", { noremap = true, silent = true })
map("n", "<M-l>", ":TmuxNavigateRight<CR>", { noremap = true, silent = true })

-- Plugins
map("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })
map("n", "<leader>ff", ":Pick files<CR>", { desc = "Open mini picker file finder" })
map("n", "<leader>fh", ":Pick help<CR>", { desc = "Open mini picker help menu" })
map("n", "<leader>fg", ":Pick grep_live<CR>", { desc = "Open mini picker live grep" })
map("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Open mini picker buffers" })
map("n", "<leader>e", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end,
	{ desc = "Open mini.files file explorer" })
map("n", "<leader>d", require("mini.diff").toggle_overlay, { desc = "Show git diffs" })
map("n", "<leader>cs", ":Themify<CR>", { desc = "Open Themify menu" })
