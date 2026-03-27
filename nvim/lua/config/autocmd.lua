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

	-- Buffers to be removed from sessions
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"NeogitStatus",
			"NeogitPopup",
			"NeogitCommitMessage",
			"codecompanion",
			"CodeCompanion",
			"minifiles",
		},
		callback = function(args)
			vim.bo[args.buf].buflisted = false
			vim.bo[args.buf].bufhidden = "wipe"
		end,
	})

	--Delete empty buffer on BufLeave
	vim.api.nvim_create_autocmd("BufLeave", {
		callback = function(args)
			local buf = args.buf
			local bufname = vim.api.nvim_buf_get_name(buf)
			local content = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
			local text = table.concat(content, "\n"):gsub("^%s*(.-)%s*$", "%1") -- strip whitespace

			if bufname == "" and text == "" then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end,
	})
end

return M
