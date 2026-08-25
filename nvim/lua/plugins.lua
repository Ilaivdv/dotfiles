vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/rachartier/tiny-cmdline.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.notify" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini-git" },
	{ src = "https://github.com/nvim-mini/mini.diff" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.indentscope" },
	{ src = "https://github.com/OXY2DEV/markview.nvim" },
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/Diogo-ss/42-header.nvim" },
	{ src = "https://github.com/LmanTW/themify.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
})

require "mason".setup()
require "oil".setup({ view_options = { show_hidden = true } })
require "vim._core.ui2".enable({ msg = { targets = "msg" } })
require "tiny-cmdline".setup()
require "mini.icons".setup()
require "mini.notify".setup({ lsp_progress = { enable = false } })
require "mini.pairs".setup()
require "mini.git".setup()
require "mini.diff".setup()
require "mini.surround".setup()

-- Show colorcolumn only if cursor is over line limit
function set_line_limit(max_line)
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		callback = function()
			local cursor_pos = vim.api.nvim_win_get_cursor(0)[2] + 1
			if cursor_pos >= max_line then vim.o.colorcolumn = tostring(max_line) else vim.o.colorcolumn = "" end
		end,
	})
end

require "mini.pick".setup({
	window = {
		config = {
			relative = "cursor",
			anchor = "NW",
			row = 0,
			col = 0,
			width = 80,
			height = 20,
		}
	}
})

require "mini.statusline".setup({
	content = {
		active = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git           = MiniStatusline.section_git({ trunc_width = 40 })
			local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
			local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo      = MiniIcons.get("file", "file." .. vim.bo.filetype) .. " " .. vim.bo.filetype
			local location      = MiniStatusline.section_location({ trunc_width = 75 })
			local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

			local reg           = vim.fn.reg_recording()
			local macro         = "" == reg and "" or " recording to " .. reg

			return MiniStatusline.combine_groups({
				{ hl = mode_hl,                 strings = { mode, macro } },
				{ hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
				'%<', -- Mark general truncate point
				{ hl = 'MiniStatuslineFilename', strings = { filename } },
				'%=', -- End left alignment
				{ hl = 'MiniStatuslineFilename', strings = { lsp } },
				{ hl = 'MiniStatuslineFileinfo', strings = { search, fileinfo } },
				{ hl = mode_hl,                  strings = { location } },
			})
		end,
	},
})

require "mini.indentscope".setup({
	draw = {
		delay = 30,
		animation = require("mini.indentscope").gen_animation.linear({ duration = 10 })
	},
	symbol = "▏",
})

require "nvim-treesitter".setup({
	main = "nvim-treesitter.configs",
	branch = "master",
	opts = {
		ensure_installed = { "bash", "markdown", "markdown_inline" },
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "markdown" },
		},
	},
})

local cmp = require "blink.cmp"
cmp.build():pwait()
cmp.setup({ keymap = { preset = "enter" } })

require "themify".setup({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/sainnhe/everforest",
	"https://github.com/shaunsingh/nord.nvim",
	"https://github.com/olivercederborg/poimandres.nvim",
})
