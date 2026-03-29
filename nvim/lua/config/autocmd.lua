--[[ Autocmd ]]

local M = {}

function M.setup()
	-- Diagnostic config. See `:help vim.diagnostic.Opts`
	vim.diagnostic.config({
		update_in_insert = false,
		severity_sort = true,
		float = { border = "rounded", source = "if_many" },
		underline = { severity = { min = vim.diagnostic.severity.WARN } },
		virtual_text = true,
		virtual_lines = false,
		jump = { float = true },
	})

	-- Highlight text on yank. See `:help vim.hl.on_yank()`
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
		callback = function()
			vim.hl.on_yank()
		end,
	})

	--Delete empty buffer on BufLeave
	vim.api.nvim_create_autocmd("BufLeave", {
		callback = function(args)
			local bufnr = args.buf
			if
				vim.bo[bufnr].modifiable == true
				and vim.bo[bufnr].buftype == ""
				and vim.bo[bufnr].modified == false
				and vim.api.nvim_buf_line_count(bufnr) == 1
				and vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] == ""
			then
				require("mini.bufremove").delete(bufnr, false)
			end
		end,
	})
end

return M
