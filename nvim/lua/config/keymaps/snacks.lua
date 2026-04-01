--[[Snacks keymaps]]

vim.keymap.set("n", "<leader>et", require("snacks.explorer").open, { desc = "[T]oggle" })
vim.keymap.set("n", "<leader>el", require("snacks.explorer").reveal, { desc = "[R]eveal" })
