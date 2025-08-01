-- load the plugins via paq-nvim when not on nix
-- YOU are in charge of putting the plugin
-- urls and build steps in here, which will only be used when not on nix.
-- and you should keep any setup functions OUT of this file

-- again, you dont need this file if you only use nix to load the config,
-- this is a fallback only, and is optional.
require("nixCatsUtils.catPacker").setup({
	--[[ ------------------------------------------ ]]
	--[[ The way to think of this is, its very      ]]
	--[[ similar to the main nix file for nixCats   ]]
	--[[                                            ]]
	--[[ It can be used to download your plugins,   ]]
	--[[ and it has an opt for optional plugins.    ]]
	--[[                                            ]]
	--[[ We dont want to handle anything about      ]]
	--[[ loading those plugins here, so that we can ]]
	--[[ use the same loading code that we use for  ]]
	--[[ our normal nix-loaded config.              ]]
	--[[ we will do all our loading and configuring ]]
	--[[ elsewhere in our configuration, so that    ]]
	--[[ we dont have to write it twice.            ]]
	--[[ ------------------------------------------ ]]
	{ "BirdeeHub/lze" },

	{ "nvim-tree/nvim-web-devicons" },
	{ "folke/which-key.nvim", opt = true },
	{ "akinsho/bufferline.nvim" },
	{ "Saghen/blink.cmp", opt = true },
	{ "rafamadriz/friendly-snippets", opt = true },
	{ "rose-pine/neovim" },
	{ "stevearc/conform.nvim", opt = true },
	{ "lewis6991/gitsigns.nvim", opt = true },
	{ "windwp/nvim-autopairs", opt = true },
	{ "nvim-telescope/telescope.nvim", opt = true },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = ":!which make && make", opt = true },
	{ "nvim-lua/plenary.nvim" },
	{ "tpope/vim-fugitive", opt = true },
	{ "kylechui/nvim-surround", opt = true },

	--  NOTE:  we take care of lazy loading elsewhere in an autocommand
	-- so that we can use the same code on and off nix.
	-- so here we just tell it not to auto load it

	-- all the rest of the setup will be done using the normal setup functions later,
	-- thus working regardless of what method loads the plugins.
	-- only stuff pertaining to downloading should be added to paq.

	-- NO NIX
	{ "williamboman/mason.nvim", opt = true },
})
-- OK, again, that isnt needed if you load this setup via nix, but it is an option.
