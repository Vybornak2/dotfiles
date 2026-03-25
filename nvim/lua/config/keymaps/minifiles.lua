local M = {}

function M.setup()
	local show_dotfiles = true

	---@diagnostic disable-next-line: unused-local
	local filter_show = function(fs_entry)
		return true
	end

	local filter_hide = function(fs_entry)
		return not vim.startswith(fs_entry.name, ".")
	end

	local toggle_dotfiles = function()
		show_dotfiles = not show_dotfiles
		local new_filter = show_dotfiles and filter_show or filter_hide
		MiniFiles.refresh({ content = { filter = new_filter } })
	end

	local set_cwd = function()
		local path = (MiniFiles.get_fs_entry() or {}).path
		if path == nil then
			return vim.notify("Cursor is not on valid entry")
		end
		vim.fn.chdir(vim.fs.dirname(path))
	end

	local yank_path = function()
		local path = (MiniFiles.get_fs_entry() or {}).path
		if path == nil then
			return vim.notify("Cursor is not on valid entry")
		end
		vim.fn.setreg(vim.v.register, path)
	end

	vim.keymap.set("n", "<leader>fr", function()
		require("mini.files").open()
	end, { desc = "[F]iles [R]oot explore" })

	vim.keymap.set("n", "<leader>fl", function()
		local buf_path = vim.api.nvim_buf_get_name(0)
		if buf_path ~= "" then
			require("mini.files").open(vim.fn.fnamemodify(buf_path, ":h"))
		else
			require("mini.files").open()
		end
	end, { desc = "[F]iles [L]ocal explore" })

	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesBufferCreate",
		callback = function(args)
			local buf_id = args.data.buf_id

			vim.keymap.set("n", "t.", toggle_dotfiles, { buffer = buf_id, desc = "Toggle dotfiles" })

			vim.keymap.set("n", "<C-s>", function()
				require("mini.files").synchronize()
			end, { buffer = buf_id, desc = "Sychronize changes" })

			vim.keymap.set("n", "<esc>", function()
				require("mini.files").close()
			end, { buffer = buf_id, desc = "Close MiniFiles" })

			vim.keymap.set("n", "<CR>", function()
				require("mini.files").go_in({ close_on_file = true })
			end, { buffer = buf_id, desc = "Open file" })

			vim.keymap.set("n", "g~", set_cwd, { buffer = buf_id, desc = "Set cwd" })
			vim.keymap.set("n", "gy", yank_path, { buffer = buf_id, desc = "Yank path" })
		end,
	})
end

return M
