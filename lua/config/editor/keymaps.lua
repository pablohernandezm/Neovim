vim.keymap.set("n", "gd", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostic window" })

vim.g.mapleader = " "
vim.g.maplocalleader = ";"
