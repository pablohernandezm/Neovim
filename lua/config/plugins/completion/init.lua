require("lze").load({
	{
		"blink.cmp",
		for_cat = "completion",
		event = "bufEnter",

		after = function(_)
			require("blink.cmp").setup({
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},

				signature = {
					enabled = true,
				},
			})
		end,
	},

	{
		"nvim-autopairs",
		for_cat = "utilities",
		event = "InsertEnter",

		after = function(_)
			require("nvim-autopairs").setup()
		end,
	},
})
