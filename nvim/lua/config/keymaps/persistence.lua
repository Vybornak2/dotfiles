--[[Persistence keymaps]]
--
local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>uss", function()
		require("persistence").save()
	end)

	vim.keymap.set("n", "<leader>usp", function()
		require("persistence").select()
	end, { desc = "[P]ick" })

	vim.keymap.set("n", "<leader>usl", function()
		require("persistence").load({ last = true })
	end, { desc = "Last [l]oad" })

	vim.keymap.set("n", "<leader>usL", function()
		require("persistence").load()
	end, { desc = "[L]oad for CWD" })

	vim.keymap.set("n", "<leader>usx", function()
		require("persistence").stop()
	end, { desc = "[X] Stop Persistence" })

	vim.keymap.set("n", "<leader>usr", function()
		require("persistence").start()
	end, { desc = "[R]un" })
end

return M
