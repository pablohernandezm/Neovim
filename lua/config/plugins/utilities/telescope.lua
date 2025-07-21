local function find_git_root() -- Use the current buffer's path as the starting point for the git search
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_dir
	local cwd = vim.fn.getcwd()
	-- If the buffer is not associated with a file, return nil
	if current_file == "" then
		current_dir = cwd
	else
		-- Extract the directory from the current file's path
		current_dir = vim.fn.fnamemodify(current_file, ":h")
	end

	-- Find the Git root directory from the current file's path
	local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 then
		print("Not a git repository. Searching on current working directory")
		return cwd
	end
	return git_root
end

local function live_grep_git_root()
	local git_root = find_git_root()
	if git_root then
		require("telescope.builtin").live_grep({
			search_dirs = { git_root },
		})
	end
end

return {
	{
		"telescope.nvim",
		for_cat = "utilities",
		cmd = { "Telescope", "LiveGrepGitRoot" },
		-- NOTE: our on attach function defines keybinds that call telescope.
		-- so, the on_require handler will load telescope when we use those.
		on_require = { "telescope" },
		-- event = "",
		-- ft = "",
		keys = {
			{
				"<leader>s/",
				function()
					require("telescope.builtin").live_grep({
						grep_open_files = true,
						prompt_title = "Live Grep in Open Files",
					})
				end,
				mode = { "n" },
				desc = "[S]earch [/] in Open Files",
			},
			{
				"<leader><leader>s",
				function()
					return require("telescope.builtin").buffers()
				end,
				mode = { "n" },
				desc = "[ ] Find existing buffers",
			},
			{
				"<leader>s.",
				function()
					return require("telescope.builtin").oldfiles()
				end,
				mode = { "n" },
				desc = '[S]earch Recent Files ("." for repeat)',
			},
			{
				"<leader>sr",
				function()
					return require("telescope.builtin").resume()
				end,
				mode = { "n" },
				desc = "[S]earch [R]esume",
			},
			{
				"<leader>sd",
				function()
					return require("telescope.builtin").diagnostics()
				end,
				mode = { "n" },
				desc = "[S]earch [D]iagnostics",
			},
			{
				"<leader>sg",
				function()
					return require("telescope.builtin").live_grep()
				end,
				mode = { "n" },
				desc = "[S]earch by [G]rep",
			},
			{
				"<leader>sw",
				function()
					return require("telescope.builtin").grep_string()
				end,
				mode = { "n" },
				desc = "[S]earch current [W]ord",
			},
			{
				"<leader>ss",
				function()
					return require("telescope.builtin").builtin()
				end,
				mode = { "n" },
				desc = "[S]earch [S]elect Telescope",
			},
			{
				"<leader>sf",
				function()
					return require("telescope.builtin").find_files()
				end,
				mode = { "n" },
				desc = "[S]earch [F]iles",
			},
			{
				"<leader>sk",
				function()
					return require("telescope.builtin").keymaps()
				end,
				mode = { "n" },
				desc = "[S]earch [K]eymaps",
			},
			{
				"<leader>sh",
				function()
					return require("telescope.builtin").help_tags()
				end,
				mode = { "n" },
				desc = "[S]earch [H]elp",
			},
		},

		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("telescope-fzf-native.nvim")
			vim.cmd.packadd("telescope-ui-select.nvim")
		end,

		after = function(_)
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				defaults = {
					mappings = {
						i = { ["<c-enter>"] = "to_fuzzy_refine" },
					},
				},
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable telescope extensions, if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})
		end,
	},
}
