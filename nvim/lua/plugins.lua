vim.pack.add({
	-- Lsp
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- Aesthetic
	{ src = "https://github.com/rachartier/tiny-cmdline.nvim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.notify" },
	{ src = "https://github.com/nvim-mini/mini.indentscope" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/LmanTW/themify.nvim" },
	{ src = "https://github.com/OXY2DEV/markview.nvim" },

	-- Utility
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.diff" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.comment" },
	{ src = "https://github.com/nvim-mini/mini.clue" },
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/vimpostor/vim-tpipeline",        event = "VeryLazy" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/Wansmer/treesj" },

	-- Extra
	{ src = "https://github.com/Diogo-ss/42-header.nvim" },
})

-- Show colorcolumn only if cursor is over line limit
function set_line_limit(max_line)
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		callback = function()
			local cursor_pos = vim.api.nvim_win_get_cursor(0)[2] + 1
			if cursor_pos >= max_line then vim.o.colorcolumn = tostring(max_line) else vim.o.colorcolumn = "" end
		end,
	})
end

require("mason").setup()
require("vim._core.ui2").enable({ msg = { targets = "msg" } })
require("tiny-cmdline").setup()
require("markview").setup()
require("trouble").setup()
require("flash").setup()
require("oil").setup({
	view_options = { show_hidden = true },
	keymaps = { ["<BS>"] = { "actions.parent", mode = "n" } }
})
require("treesj").setup()

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { { "filename", color = { bg = "" } } },
		lualine_x = { { "diagnostics", color = { bg = "" } }, { "filetype", color = { bg = "" } } },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	}
})


-- Mini
require("mini.icons").setup()
require("mini.notify").setup({ lsp_progress = { enable = false } })
require("mini.pairs").setup()
require("mini.diff").setup()
require("mini.surround").setup()
require("mini.ai").setup()
require("mini.comment").setup()

local width = math.floor(0.618 * vim.o.columns)
require("mini.pick").setup({
	options = { content_from_bottom = true },
	window = {
		config = {
			anchor = "NW",
			height = 20,
			width = width,
			row = 0,
			col = math.floor(0.5 * (vim.o.columns - width))
		}
	}
})

local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = { "n", "x" }, keys = "<Leader>" },

		-- `[` and `]` keys
		{ mode = "n",          keys = "[" },
		{ mode = "n",          keys = "]" },

		-- Built-in completion
		{ mode = "i",          keys = "<C-x>" },

		-- `g` key
		{ mode = { "n", "x" }, keys = "g" },

		-- Marks
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },

		-- Registers
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },

		-- Window commands
		{ mode = "n",          keys = "<C-w>" },

		-- `z` key
		{ mode = { "n", "x" }, keys = "z" },

		-- `s` key
		{ mode = { "n", "x" }, keys = "s" },
	},
	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},

	window = {
		delay = 250
	}
})

require("mini.indentscope").setup({
	draw = {
		delay = 30,
		animation = require("mini.indentscope").gen_animation.linear({ duration = 10 })
	},
	symbol = "▏",
})

-- Lsp
require("nvim-treesitter").setup({
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

local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({ keymap = { preset = "enter" } })

require("themify").setup({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/sainnhe/everforest",
	"https://github.com/shaunsingh/nord.nvim",
	"https://github.com/olivercederborg/poimandres.nvim",
})
