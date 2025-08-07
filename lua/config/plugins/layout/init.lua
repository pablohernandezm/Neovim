if nixCats("layout") then
	require("bufferline").setup()

	vim.keymap.set("n", "H", function()
		vim.cmd("BufferLineCyclePrev")
	end, { desc = "Previous Buffer" })

	vim.keymap.set("n", "L", function()
		vim.cmd("BufferLineCycleNext")
	end, { desc = "Next buffer" })

	vim.keymap.set("n", "<leader>bh", function()
		vim.cmd("BufferLineMovePrev")
	end, { desc = "Left buffer" })

	vim.keymap.set("n", "<leader>bl", function()
		vim.cmd("BufferLineMoveNext")
	end, { desc = "Right buffer" })

	vim.keymap.set("n", "<leader>b1", function()
		require("bufferline").move_to(1)
	end, { desc = "Go to first buffer" })

	vim.keymap.set("n", "<leader>b$", function()
		require("bufferline").move_to(-1)
	end, { desc = "Go to last buffer" })

	vim.keymap.set("n", "<leader>bse", function()
		vim.cmd("BufferLineSortByExtension")
	end, { desc = "Sort buffers by extension" })

	vim.keymap.set("n", "<leader>bsd", function()
		vim.cmd("BufferLineSortByDirectory")
	end, { desc = "Sort buffers by directory" })

	vim.keymap.set("n", "<leader>bo", function()
		vim.cmd("BufferLineCloseOthers")
	end, { desc = "Close other buffers" })

	vim.keymap.set("n", "<leader>bd", function()
		vim.cmd("bd")
	end, { desc = "Delete buffer" })

	vim.keymap.set("n", "<leader>bp", function()
		vim.cmd("BufferLineTogglePin")
	end, { desc = "Toggle pin buffer" })

	vim.keymap.set("n", "<leader>bP", function()
		vim.cmd("BufferLineGroupClose ungrouped")
	end, { desc = "Delete non-pinned buffers" })

	vim.keymap.set("n", "<leader>bH", function()
		vim.cmd("BufferLineCloseLeft")
	end, { desc = "Delete buffers to the left" })

	vim.keymap.set("n", "<leader>bL", function()
		vim.cmd("BufferLineCloseRight")
	end, { desc = "Delete buffers to the right" })

	-----------------------
	require("oil").setup({
		watch_for_changes = true,
		keymaps = {
			["L"] = { "actions.select" },
			["H"] = { "actions.parent" },
			["q"] = { "actions.close" },
		},
	})

	vim.keymap.set("n", "<leader>e", function()
		vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil")
	end, { desc = "Toggle explorer" })

	vim.keymap.set("n", "<leader>E", function()
		require("oil").toggle_float()
	end, { desc = "Toggle explorer" })
end

-----------------------
require("lze").load({
	{
		"which-key.nvim",
		for_cat = "utilities",
		event = "UIEnter",
		after = function()
			local wk = require("which-key")
			wk.setup()

			wk.add({
				-- Buffer group
				{ "<leader>b", group = "buffers", icon = "󰓩" },

				-- Git group
				{ "<leader>g", group = "Git", icon = "" },

				-- Lsp group
				{ "<leader>l", group = "LSP", icon = "" },

				-- Telescope group
				{ "<leader>s", group = "telescope" },

				-- General
				{ "<leader>w", "<cmd>w<cr>", desc = "Save file", mode = "n", icon = "" },
				{ "<leader>W", "<cmd>w!<cr>", desc = "Save file forced", mode = "n", icon = "" },
				{ "<leader>q", "<cmd>q<cr>", desc = "Quit", mode = "n" },
				{ "<leader>Q", "<cmd>q!<cr>", desc = "Force quit", mode = "n" },
			})
		end,
	},
})
