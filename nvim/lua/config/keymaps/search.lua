--[[ Search ]]

local find_config_files = function()
    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end

local grep_open_files = function()
    Snacks.picker.grep_buffers()
end

local search_current_buffer = function()
    Snacks.picker.lines()
end

local search_hidden_files = function()
    Snacks.picker.files({ hidden = true })
end

local search_todo_comments = function()
    require("todo-comments")
    Snacks.picker.todo_comments()
end

vim.keymap.set("n", "<leader>sb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sf", function() Snacks.picker.files() end, { desc = "Files" })
vim.keymap.set("n", "<leader>s.", search_hidden_files, { desc = "[.] Hidden Files)" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.git_files() end, { desc = "Git Files" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.grep() end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>sn", find_config_files, { desc = "Neovim files" })
vim.keymap.set("n", "<leader>so", grep_open_files, { desc = "Open Files" })
vim.keymap.set("n", "<leader>sr", function() Snacks.picker.recent() end, { desc = "Recent Files" })
vim.keymap.set({ "n", "v" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Word" })
vim.keymap.set("n", "<leader>s/", search_current_buffer, { desc = "Current buffer" })
vim.keymap.set("n", "<leader>st", search_todo_comments, { desc = "Todo Comments" })
