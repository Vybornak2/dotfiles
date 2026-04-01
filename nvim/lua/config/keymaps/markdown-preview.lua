--[[Keymaps Markdown-Preview]]
-- DISABLED by default

local state = { active = false }

local function md_preview_start()
	if state.active then
		return
	end

	require("markdown_preview").start()
	state.active = true
end

local function md_preview_stop()
	if not state.active then
		return
	end

	require("markdown_preview").stop()
	state.active = false
end

local function md_preview_toggle()
	if state.active then
		md_preview_stop()
	else
		md_preview_start()
	end
end

vim.api.nvim_create_user_command("MarkdownPreview", md_preview_start, { desc = "Start Markdown Preview" })
vim.api.nvim_create_user_command("MarkdownPreviewStop", md_preview_stop, { desc = "Stop Markdown Preview" })
vim.api.nvim_create_user_command("MarkdownPreviewToggle", md_preview_toggle, { desc = "Toggle Markdown Preview" })

vim.keymap.set("n", "<leader>tm", "<cmd>MarkdownPreviewToggle<CR>", { desc = "[M]arkdown" })
