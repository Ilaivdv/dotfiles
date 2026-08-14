vim.opt_local.textwidth = 80
vim.cmd("set colorcolumn=80")

vim.lsp.config('clang', {
	cmd = {'clangd'},
	filetype = {'c', 'h'},
	root_markers = {'.clangd', 'compile_commands.json'},
})

vim.lsp.enable('clang')
