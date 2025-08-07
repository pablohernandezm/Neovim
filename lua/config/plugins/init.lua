local colorscheme = nixCats("colorscheme")
if not require("nixCatsUtils").isNixCats then
	colorscheme = "rose-pine-moon"

	require("mason").setup({
		ensure_installed = {
			-- LSP: nixd not available via mason
			"css-lsp",
			"hyprls",
			"json-lsp",
			"lua-language-server",
			"postgrestools",
			"qmlls",
			"slint-lsp",
			"svelte-language-server",
			"tailwindcss-language-server",
			"taplo",
			"tinymist",
			"typescript-language-server",

			-- STYLE
			"nixfmt",
			"pgformatter",
			"rustfmt",
			"stylua",
			"typstyle",

			-- UTILS
			"deno",
			"tree-sitter-cli",
		},
	})
end

vim.cmd.colorscheme(colorscheme)

require("config.plugins.completion")
require("config.plugins.layout")
require("config.plugins.style")
require("config.plugins.utilities")
