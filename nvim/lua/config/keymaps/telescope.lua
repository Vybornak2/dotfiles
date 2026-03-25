local M = {}

function M.setup()
	local t_builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>sb", t_builtin.buffers, { desc = "[B]uffers" })
	vim.keymap.set("n", "<leader>sc", t_builtin.commands, { desc = "[C]ommands" })
	vim.keymap.set("n", "<leader>sd", t_builtin.diagnostics, { desc = "[D]iagnostics" })
	vim.keymap.set("n", "<leader>sf", t_builtin.find_files, { desc = "[F]iles" })
	vim.keymap.set("n", "<leader>sg", t_builtin.git_files, { desc = "[G]it Files" })
	vim.keymap.set("n", "<leader>sh", t_builtin.help_tags, { desc = "[H]elp" })
	vim.keymap.set("n", "<leader>sk", t_builtin.keymaps, { desc = "[K]eymaps" })
	vim.keymap.set("n", "<leader>sl", t_builtin.live_grep, { desc = "[L]ive grep" })
	vim.keymap.set("n", "<leader>sn", function()
		t_builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[N]eovim files" })
	vim.keymap.set("n", "<leader>so", function()
		t_builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
	end, { desc = "[O]pen Files" })
	vim.keymap.set("n", "<leader>sr", t_builtin.oldfiles, { desc = "[R]ecent Files" })
	vim.keymap.set({ "n", "v" }, "<leader>sw", t_builtin.grep_string, { desc = "[W]ord" })

	-- vim.keymap.set("n", "<leader>sr", t_builtin.resume, { desc = "[R]esume" })
	-- vim.keymap.set("n", "<leader>ss", t_builtin.builtin, { desc = "[S]elect Telescope" })

	vim.keymap.set("n", "<leader>s.", function()
		t_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 5,
			previewer = false,
			layout_config = {
				height = 0.5,
				width = 0.5,
				anchor = "SE",
			},
		}))
	end, { desc = "[.] Current buffer" })
end

return M
