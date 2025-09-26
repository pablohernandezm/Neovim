-- PREVIEW
vim.keymap.set("n", "<localleader>t", ":TypstPreviewToggle<CR>", { desc = "Toggle Preview" })
vim.keymap.set("n", "<localleader>s", ":TypstPreview slide<CR>", { desc = "Typst Preview - Slide" })
vim.keymap.set("n", "<localleader>d", ":TypstPreview document<CR>", { desc = "Typst Preview - Document" })
vim.keymap.set("n", "<localleader>x", ":TypstPreviewStop<CR>", { desc = "Stop Preview" })
vim.keymap.set("n", "<localleader>f", ":TypstPreviewFollowCursorToggle<CR>", { desc = "Toggle Follow Cursor" })
vim.keymap.set(
	"n",
	"<localleader>c",
	":TypstPreviewSyncCursor<CR>",
	{ desc = "Scroll preview to the current cursor position" }
)

-- Pin / Unpin
local function exec_command(params)
	local clients = vim.lsp.get_clients({ name = "tinymist", bufnr = 0 })

	if #clients == 0 then
		vim.notify("tinymist client not attached.", vim.log.levels.WARN)
		return
	end

	return clients[1]:exec_cmd(params, { bufnr = 0 })
end

vim.keymap.set("n", "<localleader>p", function()
	exec_command({
		title = "Pin Main File",
		command = "tinymist.pinMain",
		arguments = { vim.api.nvim_buf_get_name(0) },
	})
	vim.notify("Main file pinned to current buffer.", vim.log.levels.INFO)
end, {
	desc = "Tinymist Pin Main File",
	buffer = true,
	silent = true,
})

vim.keymap.set("n", "<localleader>P", function()
	exec_command({
		title = "Unpin Main File",
		command = "tinymist.pinMain",
		arguments = { vim.v.null },
	})
	vim.notify("Main file unpinned.", vim.log.levels.INFO)
end, {
	desc = "Tinymist Unpin Main File",
	buffer = true,
	silent = true,
})
