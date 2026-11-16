vim.o.tabstop = 4
vim.opt_local.textwidth = 80
set_line_limit(80)

vim.lsp.config("clangd", {
	cmd = { "clangd", "--header-insertion=never" },
	filetype = { "cpp", "hpp" },
	root_markers = { ".clangd", "compile_commands.json" },
})

vim.lsp.enable("clang")
