-- WHICH KEY
local wk_ok, wk = pcall(require, "which-key")

if wk_ok then
	wk.add({
		{ "<localleader>p", group = "Typst preview" },
		{ "<localleader>c", group = "Typst concealer" },
	})
end

-- PREVIEW
vim.keymap.set("n", "<localleader>pt", ":TypstPreviewToggle<CR>", { desc = "Toggle Preview" })
vim.keymap.set("n", "<localleader>ps", ":TypstPreview slide<CR>", { desc = "Typst Preview - Slide" })
vim.keymap.set("n", "<localleader>pd", ":TypstPreview document<CR>", { desc = "Typst Preview - Document" })
vim.keymap.set("n", "<localleader>px", ":TypstPreviewStop<CR>", { desc = "Stop Preview" })
vim.keymap.set("n", "<localleader>pf", ":TypstPreviewFollowCursorToggle<CR>", { desc = "Toggle Follow Cursor" })
vim.keymap.set(
	"n",
	"<localleader>pc",
	":TypstPreviewSyncCursor<CR>",
	{ desc = "Scroll preview to the current cursor position" }
)

-- CONCEALER
local _, concealer = pcall(require, "typst-concealer")
vim.keymap.set("n", "<localleader>ca", function()
	local success, err = pcall(concealer.enable_buf, vim.fn.bufnr())
	if not success then
		vim.notify("Error enabling typst-concealer: " .. err, vim.log.levels.ERROR)
	end
end, { desc = "Enable typst-concealer" })

vim.keymap.set("n", "<localleader>cd", function()
	local success, err = pcall(concealer.disable_buf, vim.fn.bufnr())
	if not success then
		vim.notify("Error disabling typst-concealer: " .. err, vim.log.levels.ERROR)
	end
end, { desc = "Disable typst-concealer" })
