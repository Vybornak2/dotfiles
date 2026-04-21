--[[ General Keymmaps ]]

-- [[ General keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Arrow key hints ]]
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- [[ Diagnostics ]]
vim.keymap.set("n", "L", function()
    vim.diagnostic.open_float({
        scope = "line",
    })
end, { desc = "Line Diagnostics" })

--[[ Explorer]]
vim.keymap.set("n", "<leader>e", function() Snacks.explorer.open() end, { desc = "Explorer" })

vim.keymap.set("n", "<leader><leader>", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>`", function() Snacks.picker.notifications() end, { desc = "Notification History" })

