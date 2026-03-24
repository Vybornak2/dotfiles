local M = {}

function M.setup()
	local t_builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>sh", t_builtin.help_tags, { desc = "[S]earch [H]elp" })
	vim.keymap.set("n", "<leader>sk", t_builtin.keymaps, { desc = "[S]earch [K]eymaps" })
	vim.keymap.set("n", "<leader>sf", t_builtin.find_files, { desc = "[S]earch [F]iles" })
	vim.keymap.set("n", "<leader>ss", t_builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
	vim.keymap.set({ "n", "v" }, "<leader>sw", t_builtin.grep_string, { desc = "[S]earch current [W]ord" })
	vim.keymap.set("n", "<leader>sg", t_builtin.live_grep, { desc = "[S]earch by [G]rep" })
	vim.keymap.set("n", "<leader>sd", t_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
	vim.keymap.set("n", "<leader>sr", t_builtin.resume, { desc = "[S]earch [R]esume" })
	vim.keymap.set("n", "<leader>s.", t_builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	vim.keymap.set("n", "<leader>sc", t_builtin.commands, { desc = "[S]earch [C]ommands" })
	vim.keymap.set("n", "<leader>sb", t_builtin.buffers, { desc = "[S]earch [B]uffers" })

	vim.keymap.set("n", "<leader>/", function()
		t_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 5,
			previewer = false,
			layout_config = {
				height = 0.5,
				width = 0.5,
				anchor = "SE",
			},
		}))
	end, { desc = "[/] Fuzzily search in current buffer" })

	vim.keymap.set("n", "<leader>s/", function()
		t_builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
	end, { desc = "[S]earch [/] in Open Files" })

	vim.keymap.set("n", "<leader>sn", function()
		t_builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[S]earch [N]eovim files" })
end

return M
