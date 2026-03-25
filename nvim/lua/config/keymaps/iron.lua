local M = {}

function M.setup()
	vim.keymap.set({ "n", "v" }, "<leader>rt", function()
		-- Open a vertical split
		vim.cmd("vs")
		-- Get the current filetype
		local ft = vim.bo.filetype
		require("iron.core").repl_here(ft)
	end, { desc = "[R]epl [T]oggle" })

	vim.keymap.set("n", "<leader>rr", "<cmd>IronRepl<cr>", { desc = "[R]epl [R]un/Toggle" })
	vim.keymap.set("n", "<leader>rR", "<cmd>IronRestart<cr>", { desc = "[R]epl [R]estart" })
	vim.keymap.set({ "n", "v" }, "<leader>rc", function()
		require("iron.core").send_motion()
	end, { desc = "[R]epl [C]ode (motion/visual)" })

	vim.keymap.set("n", "<leader>rf", function()
		require("iron.core").send_file()
	end, { desc = "[R]epl [F]ile" })

	vim.keymap.set("n", "<leader>rl", function()
		require("iron.core").send_line()
	end, { desc = "[R]epl [L]ine" })

	vim.keymap.set("n", "<leader>rp", function()
		require("iron.core").send_paragraph()
	end, { desc = "[R]epl [P]aragraph" })

	vim.keymap.set("n", "<leader>ru", function()
		require("iron.core").send_until_cursor()
	end, { desc = "[R]epl [U]ntil cursor" })

	vim.keymap.set("n", "<leader>rm", function()
		require("iron.core").send_mark()
	end, { desc = "[R]epl [M]ark" })

	vim.keymap.set("n", "<leader>rb", function()
		require("iron.core").send_code_block()
	end, { desc = "[R]epl [B]lock" })

	vim.keymap.set("n", "<leader>rn", function()
		require("iron.core").send_code_block_and_move()
	end, { desc = "[R]epl block a[N]d move" })

	vim.keymap.set("n", "<leader>rq", "<cmd>IronClose<cr>", { desc = "[R]epl [Q]uit" })
	vim.keymap.set("n", "<leader>rcl", "<cmd>IronClear<cr>", { desc = "[R]epl [CL]ear" })
end

return M
