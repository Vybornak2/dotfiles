--[[ Buffers ]]

vim.keymap.set("n", "<leader>bdt", function() Snacks.bufdelete() end, { desc = "Delete" })
vim.keymap.set("n", "<leader>bdo", function() Snacks.bufdelete.other() end, { desc = "Other" })
vim.keymap.set("n", "<leader>bdA", function() Snacks.bufdelete.all() end, { desc = "All" })
vim.keymap.set("n", "<leader>be", function() Snacks.scratch() end, { desc = "Empty" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Prev" })
vim.keymap.set("n", "<leader>bb", "<C-6>", { desc = "Back" })
vim.keymap.set("n", "<leader>bs", function() Snacks.picker.buffers() end, { desc = "Search" })
vim.keymap.set("n", "<leader>br", function()
    Snacks.picker.buffers({ sort_lastused = true })
end, { desc = "Recent" })
