--[[Telescope Keymaps]]

local find_config_files = function()
	require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end

local live_grep_open_files = function()
	require("telescope.builtin").live_grep(
		{ grep_open_files = true, prompt_title = "Live Grep in Open Files" }
	)
end

local search_current_buffer = function()
	require("telescope.builtin").current_buffer_fuzzy_find(
		require("telescope.themes").get_dropdown({
			winblend = 5,
			previewer = false,
			layout_config = {
				height = 0.5,
				width = 0.5,
				anchor = "SE",
			},
		}))
end

vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "[B]uffers" })
vim.keymap.set("n", "<leader>sc", require("telescope.builtin").commands, { desc = "[C]ommands" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[D]iagnostics" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[F]iles" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").git_files, { desc = "[G]it Files" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[H]elp" })
vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "[K]eymaps" })
vim.keymap.set("n", "<leader>sl", require("telescope.builtin").live_grep, { desc = "[L]ive grep" })
vim.keymap.set("n", "<leader>sn", find_config_files, { desc = "[N]eovim files" })
vim.keymap.set("n", "<leader>so", live_grep_open_files, { desc = "[O]pen Files" })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").oldfiles, { desc = "[R]ecent Files" })
vim.keymap.set({ "n", "v" }, "<leader>sw", require("telescope.builtin").grep_string, { desc = "[W]ord" })
vim.keymap.set("n", "<leader>s.", search_current_buffer, { desc = "[.] Current buffer" })

-- vim.keymap.set("n", "<leader>sr", t_builtin.resume, { desc = "[R]esume" })
-- vim.keymap.set("n", "<leader>ss", t_builtin.builtin, { desc = "[S]elect Telescope" })
