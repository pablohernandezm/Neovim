require("lze").load({
	{ import = "config.plugins.utilities.telescope" },

	{
		"nvim-surround",
		for_cat = "utilities",
		event = "UIEnter",
		-- keys = "",
		after = function(_)
			require("nvim-surround").setup()
		end,
	},

	{
		"gitsigns",
		for_cat = "utilities",
		event = "UIEnter",
		keys = {
			{ "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Git preview hunk" },
			{ "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", desc = "Git line blame" },
		},
		after = function(_)
			require("gitsigns").setup()
		end,
	},

	{
		"mason.nvim",
		-- only run it when not on nix
		enabled = not require("nixCatsUtils").isNixCats,
		on_plugin = { "nvim-lspconfig" },
		load = function(name)
			require("mason").setup()
		end,
	},
})
