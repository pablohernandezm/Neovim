-- Imports
require("config.editor.keymaps")
require("config.editor.autocmds")

-- Tabulation and indentation settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Convert tabs into spaces
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Behavior
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.mouse = "a"

-- Line numbering settings
vim.opt.number = true
vim.opt.relativenumber = true

-- Visuals
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.synmaxcol = 300

-- clipboard
vim.o.clipboard = "unnamedplus"

-- Spell checker
vim.opt.spelllang = "en,es"
vim.opt.spell = true

-- File handling
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false

-- Special directories
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true

UNDODIR = vim.env.HOME .. "/.cache/nvim/undodir/"
vim.opt.undodir = UNDODIR

-- LSP
vim.lsp.enable("luals")
vim.lsp.enable("nixd")
vim.lsp.enable("rust-analyzer")
vim.lsp.enable("tinymist")
vim.lsp.enable("taplo")
vim.lsp.enable("jsonls")
vim.lsp.enable("cssls")
vim.lsp.enable("qmlls")
vim.lsp.enable("slint_lsp")

vim.diagnostic.config({
	update_in_insert = true,
	virtual_text = {
		prefix = "",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰞏",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})
