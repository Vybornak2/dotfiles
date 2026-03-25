local M = {}

function M.setup()
	-- General keymaps
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
	vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

	-- Arrow key hints
	vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
	vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
	vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
	vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

	-- Window navigation
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

	-- Diagnostics
	vim.keymap.set("n", "<leader>td", vim.diagnostic.setloclist, { desc = "[D]iagnostic list" })

	-- Git / Neogit / GitSigns
	vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "[G]it [G]ui" })
	-- { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
	vim.keymap.set("n", "<leader>ts", ":Gitsigns stage_hunk<CR>", { desc = "[T]oggle git [S]igns" })

	-- Neovim config reload
	vim.keymap.set("n", "<leader>nr", function()
		for name, _ in pairs(package.loaded) do
			if name:match("^plugins") or name:match("^config") then
				package.loaded[name] = nil
			end
		end
		dofile(vim.env.MYVIMRC)
		vim.notify("Config Reloaded!")
	end, { desc = "[N]eovim [R]eload" })

	-- Format (conform.nvim)
	vim.keymap.set("", "<leader><leader>", function()
		require("conform").format({ async = true, lsp_format = "fallback" })
	end, { desc = "Format buffer" })
end

return M
