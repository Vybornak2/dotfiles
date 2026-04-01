--[[ Git Keymaps ]]
--
-- Includes:
--   Neogit
--   Gitsigns
--   Diffview

local next_hunk = function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		require("gitsigns").nav_hunk("next")
	end
end

local prev_hunk = function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		require("gitsigns").nav_hunk("prev")
	end
end

local stage_hunk_visual = function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end

local reset_hunk_visual = function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end

local blame_line = function()
	require("gitsigns").blame_line({ full = true })
end

local diffthis_staged = function()
	require("gitsigns").diffthis("~")
end

local diffview_open_file = function()
	require("diffview").open({ "--", vim.fn.expand("%") })
end

local diffview_open_file_history = function()
	require("diffview").file_history(nil, { vim.fn.expand("%") })
end

local quick_fix_all = function()
	require("gitsigns").setqflist("all")
	vim.cmd("copen")
end

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "[G]it" })
vim.keymap.set("n", "]c", next_hunk, { desc = "Next [C]hange" })
vim.keymap.set("n", "[c", prev_hunk, { desc = "Prev [C]hange" })

vim.keymap.set("n", "<leader>gs", require("gitsigns").stage_hunk, { desc = "[S]tage hunk" })
vim.keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk, { desc = "[R]eset hunk" })
vim.keymap.set("v", "<leader>gs", stage_hunk_visual, { desc = "[S]tage hunk" })
vim.keymap.set("v", "<leader>gr", reset_hunk_visual, { desc = "[R]eset hunk" })

vim.keymap.set("n", "<leader>gS", require("gitsigns").stage_buffer, { desc = "[S]tage buffer" })
vim.keymap.set("n", "<leader>gR", require("gitsigns").reset_buffer, { desc = "[R]eset buffer" })
vim.keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk, { desc = "[P]review hunk" })
vim.keymap.set("n", "<leader>gi", require("gitsigns").preview_hunk_inline, { desc = "Preview [I]nline" })

vim.keymap.set({ "o", "x" }, "ih", require("gitsigns").select_hunk, { desc = "Select [H]unk" })

vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis, { desc = "[D]iff this" })
vim.keymap.set("n", "<leader>gD", diffthis_staged, { desc = "[D]iff staged" })

vim.keymap.set("n", "<leader>gq", require("gitsigns").setqflist, { desc = "[Q]uickfix hunks" })
vim.keymap.set("n", "<leader>gQ", quick_fix_all, { desc = "[Q]uickfix all hunks" })

vim.keymap.set("n", "<leader>gb", blame_line, { desc = "[B]lame line" })

-- Toggle options
vim.keymap.set("n", "<leader>tb", require("gitsigns").toggle_current_line_blame, { desc = "Git [B]lame" })
vim.keymap.set("n", "<leader>tw", require("gitsigns").toggle_word_diff, { desc = "[W]ord diff" })

-- Diffview
vim.keymap.set("n", "<leader>gv", require("diffview").open, { desc = "Diff[v]iew" })
vim.keymap.set("n", "<leader>gV", diffview_open_file, { desc = "Diff[V]iew file" })
vim.keymap.set("n", "<leader>gh", diffview_open_file_history, { desc = "File [H]istory" })
