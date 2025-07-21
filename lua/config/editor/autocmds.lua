-- Terminal emulators
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	desc = "Kitty - No padding with neovim",
	callback = function()
		vim.cmd(":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=0")
	end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	desc = "Kitty - Padding when leaving neovim",
	callback = function()
		vim.cmd(":silent !kitty @ set-spacing padding=10")
	end,
})
