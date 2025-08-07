return {
	{
		"nvim-treesitter",
		for_cat = "utilities",
		event = "UIEnter",
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("nvim-treesitter-textobjects")
		end,
		after = function(_)
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = false },

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<M-space>",
					},
				},

				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Look forward for better context
						keymaps = {
							["af"] = { query = "@function.outer", desc = "Select outer function" },
							["if"] = { query = "@function.inner", desc = "Select inner function" },
							["ac"] = { query = "@class.outer", desc = "Select outer class/struct" },
							["ic"] = { query = "@class.inner", desc = "Select inner class/struct" },
							["ab"] = { query = "@block.outer", desc = "Select outer block" },
							["ib"] = { query = "@block.inner", desc = "Select inner block" },
							["ap"] = { query = "@parameter.outer", desc = "Select outer parameter" },
							["ip"] = { query = "@parameter.inner", desc = "Select inner parameter" },
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- Add to jumplist for navigation
						goto_next_start = {
							["]f"] = { query = "@function.outer", desc = "Go to next function start" },
							["]c"] = { query = "@class.outer", desc = "Go to next class/struct start" },
							["]b"] = { query = "@block.outer", desc = "Go to next block start" },
						},
						goto_previous_start = {
							["[f"] = { query = "@function.outer", desc = "Go to previous function start" },
							["[c"] = { query = "@class.outer", desc = "Go to previous class/struct start" },
							["[b"] = { query = "@block.outer", desc = "Go to previous block start" },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>xn"] = { query = "@parameter.outer", desc = "Swap with next parameter" },
						},
						swap_previous = {
							["<leader>xp"] = { query = "@parameter.outer", desc = "Swap with previous parameter" },
						},
					},
				},

				-- Context-aware comment strings
				context_commentstring = {
					enable = true,
					enable_autocmd = false, -- Use with Comment.nvim for manual control
				},
			})

			-- Which-key integration for discoverability
			local status_ok, wk = pcall(require, "which-key")
			if status_ok then
				wk.add({
					{ "<leader>x", group = "Swap (Treesitter)" }, -- Group for swap actions
					{ "a", group = "Select around (Treesitter)" }, -- Group for outer selections
					{ "i", group = "Select inner (Treesitter)" }, -- Group for inner selections
					{ "]", group = "Go to next (Treesitter)" }, -- Group for next navigation
					{ "[", group = "Go to previous (Treesitter)" }, -- Group for previous navigation
				})
			end
		end,
	},
}
