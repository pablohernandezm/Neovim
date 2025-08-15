local state = {
	floating = {
		win = -1,
		buf = -1,
	},
}

local function open_floating_term(opts)
	opts = opts or {}
	vim.validate({
		width = {
			opts.width,
			function(v)
				return v == nil or type(v) == "number"
			end,
			"number or nil",
		},
		height = {
			opts.height,
			function(v)
				return v == nil or type(v) == "number"
			end,
			"number or nil",
		},

		buf = {
			opts.buf,
			function(v)
				return v == nil or type(v) == "number"
			end,
		},
	})

	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local buf = opts.buf
	if not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	return { buf = buf, win = win }
end

local function toggleFloat()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = open_floating_term({ buf = state.floating.buf })

		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			local cmd = vim.fn.executable("tmux") == 1 and "tmux new-session -A -s neovim-session" or vim.o.shell
			vim.fn.jobstart(cmd, { term = true, bufnr = state.floating.buf })
		end

		vim.cmd.startinsert()
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

vim.api.nvim_create_user_command("ToggleFLoatingTerminal", toggleFloat, {})

local keymap = vim.keymap.set

keymap({ "n", "t" }, "<C-/>", toggleFloat, { desc = "Open Float Win" })
keymap("t", "<C-v>", "<C-\\><C-n>", { desc = "Visual mode in terminal" })
