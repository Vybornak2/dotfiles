--[[ Tabs ]]

local map = vim.keymap.set

map("n", "<leader><tab><tab>", function()
    vim.cmd.tabnew()
end, { desc = "New Tab" })

map("n", "<leader><tab>p", function()
    vim.cmd.tabprevious()
end, { desc = "Prev Tab" })

map("n", "<leader><tab>n", function()
    vim.cmd.tabnext()
end, { desc = "Next Tab" })

map("n", "<leader><tab>d", function()
    vim.cmd.tabclose()
end, { desc = "Close Tab" })

map("n", "<leader><tab>o", function()
    vim.cmd.tabonly()
end, { desc = "Close Other Tabs" })

map("n", "<leader><tab>f", function()
    vim.cmd.tabfirst()
end, { desc = "First Tab" })

map("n", "<leader><tab>l", function()
    vim.cmd.tablast()
end, { desc = "Last Tab" })
