--[[Persistence keymaps]]

local clean_empty_buffers = function()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_valid(buf.bufnr) and vim.api.nvim_buf_line_count(buf.bufnr) == 1 then
			vim.api.nvim_buf_delete(buf.bufnr, { force = true })
		end
	end
end

local load_last = function()
	require("persistence").load({ last = true })
end

vim.keymap.set("n", "<leader>uss", require("persistence").save, { desc = "[S]ave" })
vim.keymap.set("n", "<leader>usp", require("persistence").select, { desc = "[P]ick" })
vim.keymap.set("n", "<leader>usl", load_last, { desc = "Last [l]oad" })
vim.keymap.set("n", "<leader>usL", require("persistence").load, { desc = "[L]oad for CWD" })
vim.keymap.set("n", "<leader>usx", require("persistence").stop, { desc = "[X] Stop Persistence" })
vim.keymap.set("n", "<leader>usr", require("persistence").start, { desc = "[R]un" })
