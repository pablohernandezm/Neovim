require("lze").load({
	{
		"blink.cmp",
		for_cat = "completion",
		event = "bufEnter",

		after = function(_)
			require("blink.cmp").setup({
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
					per_filetype = {
						sql = { "snippets", "dadbod", "buffer" },
					},
					providers = {
						dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
					},
				},

				signature = {
					enabled = true,
				},
			})
		end,
	},

	{ "kristijanhusak/vim-dadbod-completion", for_cat = "completion", ft = { "sql", "mysql", "plsql" }, lazy = true },

	{ "kristijanhusak/vim-dadbod-ui", for_cat = "completion", lazy = true },

	{
		"tpope/vim-dadbod",
		for_cat = "completion",
		lazy = true,
		dep_of = {
			"vim-dadbod-completion",
			"vim-dadbod-ui",
		},
	},
})

if nixCats("completion") then
	-- Connections
	vim.g.dbs = {
		{ name = "migrations", url = "postgresql://postgres:postgres@127.0.0.1:54322/postgres" },
	}

	-- Key maps
	vim.keymap.set("n", "<leader>Dt", ":DBUIToggle<CR>", { desc = "DadbodUI toggle" })
	vim.keymap.set("n", "<leader>Da", ":DBUIAddConnection<CR>", { desc = "DadbodUI Add Connection" })
	vim.keymap.set("n", "<leader>Df", ":DBUIFindBuffer<CR>", { desc = "DadbodUI Find Buffer" })
	vim.keymap.set("n", "<leader>Dc", ":DBCompletionClearCache<CR>", { desc = "DadbodUI clear cache" })

	-- Which-key integration for discoverability
	local status_ok, wk = pcall(require, "which-key")
	if status_ok then
		wk.add({
			{ "<leader>D", group = "Dadbod" },
		})
	end
end
