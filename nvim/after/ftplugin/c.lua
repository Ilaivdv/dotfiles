vim.o.tabstop = 4
vim.opt_local.textwidth = 80
set_line_limit(80)

vim.lsp.config('clang', {
	cmd = {'clangd'},
	filetype = {'c', 'h'},
	root_markers = {'.clangd', 'compile_commands.json'},
})

vim.lsp.enable('clang')
