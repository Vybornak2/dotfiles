--[[ General Keymmaps ]]

local map = vim.keymap.set

-- [[ General keymaps ]]
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Arrow key hints ]]
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- [[ Diagnostics ]]
map("n", "L", function()
    vim.diagnostic.open_float({
        scope = "line",
    })
end, { desc = "Line Diagnostics" })

--[[ Explorer]]
map("n", "<leader>e", function()
    Snacks.explorer.open()
end, { desc = "Explorer" })

map("n", "<leader><leader>", function()
    Snacks.picker.files()
end, { desc = "Find Files" })

map("n", "<leader>:", function()
    Snacks.picker.command_history()
end, { desc = "Command History" })

map("n", "<leader>`", function()
    Snacks.picker.notifications()
end, { desc = "Notification History" })
