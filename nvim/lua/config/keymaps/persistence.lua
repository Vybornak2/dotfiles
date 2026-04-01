--[[Persistence keymaps]]

local clean_empty_buffers = function()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_valid(buf.bufnr) and vim.api.nvim_buf_line_count(buf.bufnr) == 1 then
			vim.api.nvim_buf_delete(buf.bufnr, { force = true })
		end
	end
end

vim.keymap.set("n", "<leader>uss", function()
	require("persistence").save()
end, { desc = "[S]ave" })

vim.keymap.set("n", "<leader>usp", function()
	require("persistence").select()
end, { desc = "[P]ick" })

vim.keymap.set("n", "<leader>usl", function()
	require("persistence").load({ last = true })
end, { desc = "Last [l]oad" })

vim.keymap.set("n", "<leader>usL", function()
	require("persistence").load()
	clean_empty_buffers()
end, { desc = "[L]oad for CWD" })

vim.keymap.set("n", "<leader>usx", function()
	require("persistence").stop()
	clean_empty_buffers()
end, { desc = "[X] Stop Persistence" })

vim.keymap.set("n", "<leader>usr", function()
	require("persistence").start()
	clean_empty_buffers()
end, { desc = "[R]un" })
