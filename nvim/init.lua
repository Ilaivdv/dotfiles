-- Global options
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.showmatch = true
vim.o.number = true
vim.o.wrap = false

-- Hide statusline for tmux
vim.o.laststatus = 0

vim.o.backspace = "indent,eol,start"
vim.o.shiftwidth = 0
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8

vim.o.selection = "exclusive"
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.winborder = "solid"
vim.o.cmdheight = 0
vim.o.swapfile = false
vim.o.autoread = true
vim.o.updatetime = 300
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.hidden = true

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

require("plugins")
require("keybinds")

-- For CODAM header
vim.g.user = "ivan-der"
vim.g.mail = "ivan-der@student.codam.nl"

require "42header".setup({
	asciiart = {
		"      ::::    :::        ",
		"     :+:+:   :+:         ",
		"    :+:+:+  +:+          ",
		"   +#+ +:+ +#+           ",
		"  +#+  +#+#+#            ",
		" #+#   #+#+#             ",
		"###    #### orminette :( ",
	},
})
