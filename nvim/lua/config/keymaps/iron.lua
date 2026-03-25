--[[ REPL Keymaps ]]
local M = {}

local function find_repl_buf(ft)
	local repl_tag = ft .. "_repl"

	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(bufnr) and vim.b[bufnr].repl_tag == repl_tag then
			return bufnr
		end
	end
end

local function ensure_repl(ft)
	local repl_bufnr = find_repl_buf(ft)
	if repl_bufnr then
		return false, repl_bufnr
	end

	vim.cmd("vs")
	require("iron.core").repl_here(ft)
	repl_bufnr = vim.api.nvim_get_current_buf()
	vim.b[repl_bufnr].repl_tag = ft .. "_repl"

	return true, repl_bufnr
end

local function current_ft_or_warn(action)
	local ft = vim.bo.filetype
	if ft == "" then
		vim.notify("No filetype detected for REPL " .. action, vim.log.levels.WARN)
		return nil
	end

	return ft
end

local function toggle_repl()
	local ft = current_ft_or_warn("toggle")
	if not ft then
		return
	end

	local created, repl_bufnr = ensure_repl(ft)
	if created then
		return
	end

	local repl_wins = vim.fn.win_findbuf(repl_bufnr)
	if #repl_wins > 0 then
		vim.cmd("IronHide " .. ft)
		return
	end

	vim.cmd("vs")
	vim.api.nvim_win_set_buf(0, repl_bufnr)
end

local function focus_repl()
	local ft = current_ft_or_warn("focus")
	if not ft then
		return
	end

	require("iron.core").focus_on(ft)
end

local function send_to_repl()
	local core = require("iron.core")
	local mode = vim.fn.mode()
	local src_win = vim.api.nvim_get_current_win()
	local ft = current_ft_or_warn("send")
	if not ft then
		return
	end

	if mode == "v" or mode == "V" or mode == "\22" then
		core.mark_visual()
		ensure_repl(ft)
		if vim.api.nvim_win_is_valid(src_win) then
			vim.api.nvim_set_current_win(src_win)
		end
		core.send_mark()
		return
	end

	ensure_repl(ft)
	if vim.api.nvim_win_is_valid(src_win) then
		vim.api.nvim_set_current_win(src_win)
	end
	core.send_line()
end

local function send_file_to_repl()
	local ft = current_ft_or_warn("file")
	if not ft then
		return
	end

	local src_win = vim.api.nvim_get_current_win()
	ensure_repl(ft)
	if vim.api.nvim_win_is_valid(src_win) then
		vim.api.nvim_set_current_win(src_win)
	end

	require("iron.core").send_file()
end

local function send_paragraph_to_repl()
	local ft = current_ft_or_warn("paragraph")
	if not ft then
		return
	end

	local src_win = vim.api.nvim_get_current_win()
	ensure_repl(ft)
	if vim.api.nvim_win_is_valid(src_win) then
		vim.api.nvim_set_current_win(src_win)
	end

	require("iron.core").send_paragraph()
end

local function send_raw_to_repl(action, payload)
	local ft = current_ft_or_warn(action)
	if not ft then
		return
	end

	require("iron.core").send(ft, payload)
end

local function quit_repl()
	send_raw_to_repl("quit", "quit")
end

local function clear_repl()
	send_raw_to_repl("clear", "clear")
end

function M.setup()
	vim.keymap.set({ "n", "v" }, "<leader>rt", toggle_repl, { desc = "[T]oggle" })
	vim.keymap.set({ "n", "v" }, "<leader>rf", focus_repl, { desc = "[F]ocus" })
	vim.keymap.set({ "n", "v" }, "<leader>rs", send_to_repl, { desc = "[S]end" })
	vim.keymap.set("n", "<leader>rR", "<cmd>IronRestart<cr>", { desc = "[R]estart" })
	vim.keymap.set("n", "<leader>rf", send_file_to_repl, { desc = "[F]ile" })
	vim.keymap.set("n", "<leader>rp", send_paragraph_to_repl, { desc = "[P]aragraph" })
	vim.keymap.set("n", "<leader>rq", quit_repl, { desc = "[Q]uit" })
	vim.keymap.set("n", "<leader>rc", clear_repl, { desc = "[C]lear" })
end

return M
