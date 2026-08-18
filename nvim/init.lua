-- Global options
vim.o.number = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.relativenumber = true
vim.o.shiftwidth = 0
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.autoread = true
vim.o.winborder = "rounded"
vim.o.cmdheight = 0
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
