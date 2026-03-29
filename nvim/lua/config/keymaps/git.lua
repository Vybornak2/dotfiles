--[[ Git Keymaps ]]

local M = {}

function M.setup()
	local gitsigns = require("gitsigns")

	vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "[G]it" })

	-- Navigation
	vim.keymap.set("n", "]c", function()
		if vim.wo.diff then
			vim.cmd.normal({ "]c", bang = true })
		else
			gitsigns.nav_hunk("next")
		end
	end, { desc = "Next [C]hange" })

	vim.keymap.set("n", "[c", function()
		if vim.wo.diff then
			vim.cmd.normal({ "[c", bang = true })
		else
			gitsigns.nav_hunk("prev")
		end
	end, { desc = "Prev [C]hange" })

	-- Hunk actions
	vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[S]tage hunk" })
	vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[R]eset hunk" })
	vim.keymap.set("v", "<leader>gs", function()
		gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, { desc = "[S]tage hunk" })
	vim.keymap.set("v", "<leader>gr", function()
		gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, { desc = "[R]eset hunk" })

	-- Buffer actions
	vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[S]tage buffer" })
	vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[R]eset buffer" })

	-- Inspect
	vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[P]review hunk" })
	vim.keymap.set("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Preview [I]nline" })
	vim.keymap.set("n", "<leader>gb", function()
		gitsigns.blame_line({ full = true })
	end, { desc = "[B]lame line" })

	-- Diff
	vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "[D]iff this" })
	vim.keymap.set("n", "<leader>gD", function()
		gitsigns.diffthis("~")
	end, { desc = "[D]iff this ~" })

	-- Diffview
	local diffview = require("diffview")
	vim.keymap.set("n", "<leader>gv", diffview.open, { desc = "Diff[v]iew" })
	vim.keymap.set("n", "<leader>gV", function()
		diffview.open({ "--", vim.fn.expand("%") })
	end, { desc = "Diff[V]iew file" })
	vim.keymap.set("n", "<leader>gh", function()
		diffview.file_history(nil, { vim.fn.expand("%") })
	end, { desc = "File [H]istory" })

	-- Quickfix
	vim.keymap.set("n", "<leader>gq", gitsigns.setqflist, { desc = "[Q]uickfix hunks" })
	vim.keymap.set("n", "<leader>gQ", function()
		gitsigns.setqflist("all")
	end, { desc = "[Q]uickfix all hunks" })

	-- Toggles
	vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Git [B]lame" })
	vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "[W]ord diff" })

	-- Text object
	vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select [H]unk" })
end

return M
