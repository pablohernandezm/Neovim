if nixCats("debug") then
	require("nvim-dap-virtual-text").setup({
		enabled = true,
		enabled_commands = true,
		highlight_changed_variables = true,
		show_stop_reason = true,
		virt_text_pos = "eol",
	})

	local dap, dapui = require("dap"), require("dapui")
	dapui.setup()

	-- Breakpoint management
	vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })

	vim.keymap.set("n", "<leader>dB", function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, { desc = "Set conditional breakpoint" })

	vim.keymap.set("n", "<leader>dl", function()
		dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end, { desc = "Set log point" })

	-- Execution control
	vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "Run to cursor" })

	vim.keymap.set("n", "<F1>", dap.continue, { desc = "Continue or start debugging" })
	vim.keymap.set("n", "<leader>dd", dap.continue, { desc = "Continue or start debugging" })

	vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Step into" })
	vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })

	vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Step over" })
	vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })

	vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Step out" })
	vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Step out" })

	vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Step back" })
	vim.keymap.set("n", "<leader>dp", dap.step_back, { desc = "Step back" })

	vim.keymap.set("n", "<F6>", dap.restart, { desc = "Restart debugging" })
	vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart debugging" })

	vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate debugging" })

	-- DAP UI interactions
	vim.keymap.set("n", "<leader>dU", function()
		dapui.toggle()
	end, { desc = "Toggle DAP UI" })

	vim.keymap.set("n", "<leader>de", function()
		dapui.eval(nil, { enter = true })
	end, { desc = "Evaluate expression under cursor" })

	-- Variable inspection
	vim.keymap.set("n", "<leader>dh", function()
		require("dap.ui.widgets").hover()
	end, { desc = "Hover variable info" })

	vim.keymap.set("n", "<leader>dp", function()
		require("dap.ui.widgets").preview()
	end, { desc = "Preview variable in floating window" })

	-- Which-key integration (optional)
	local status_ok, wk = pcall(require, "which-key")
	if status_ok then
		wk.add({ "<leader>d", group = "debug" })
	end

	-- DAP UI auto-open/close
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end
