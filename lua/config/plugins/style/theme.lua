if nixCats("style") and vim.g.colors_name and vim.g.colors_name:match("rose%-pine") then
	require("lze").load({
		{
			"bufferline.nvim",
			for_cat = "utilities",
			event = "ColorScheme",
			after = function(_)
				local highlights = require("rose-pine.plugins.bufferline")
				require("bufferline").setup({ highlights = highlights })
			end,
		},
	})

	require("rose-pine").setup({
		variant = "auto", -- auto, main, moon, or dawn
		dark_variant = "main", -- main, moon, or dawn
		dim_inactive_windows = false,
		extend_background_behind_borders = true,

		enable = {
			terminal = true,
			legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
			migrations = true, -- Handle deprecated options automatically
		},

		styles = {
			bold = true,
			italic = true,
			transparency = false,
		},

		groups = {
			border = "muted",
			link = "iris",
			panel = "surface",

			error = "love",
			hint = "iris",
			info = "foam",
			note = "pine",
			todo = "rose",
			warn = "gold",

			git_add = "foam",
			git_change = "rose",
			git_delete = "love",
			git_dirty = "rose",
			git_ignore = "muted",
			git_merge = "iris",
			git_rename = "pine",
			git_stage = "iris",
			git_text = "rose",
			git_untracked = "subtle",

			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},

		palette = {
			-- Override the builtin palette per variant
			-- moon = {
			--     base = '#18191a',
			--     overlay = '#363738',
			-- },
		},

		-- NOTE: Highlight groups are extended (merged) by default. Disable this
		-- per group via `inherit = false`
		highlight_groups = {
			Comment = { fg = "subtle" },
			VertSplit = { fg = "muted", bg = "muted" },
			Visual = { fg = "base", bg = "text", inherit = false },
			StatusLine = { fg = "rose", bg = "rose", blend = 10 },
			StatusLineNC = { fg = "subtle", bg = "surface" },
			CurSearch = { fg = "base", bg = "leaf", inherit = false },
			Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
			TelescopeBorder = { fg = "highlight_high", bg = "none" },
			TelescopeNormal = { bg = "none" },
			TelescopePromptNormal = { bg = "base" },
			TelescopeResultsNormal = { fg = "subtle", bg = "none" },
			TelescopeSelection = { fg = "text", bg = "base" },
			TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
		},
	})

	-- "vim.cmd("colorscheme rose-pine")
	-- vim.cmd("colorscheme rose-pine-main")
	vim.cmd("colorscheme rose-pine-moon")
	-- vim.cmd("colorscheme rose-pine-dawn")

	vim.opt.laststatus = 3 -- Or 3 for global statusline
	vim.opt.statusline = "   %f %y %m   %= %l:%c ♥"
end
