--[[ Search ]]

map = vim.keymap.set

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

map("n", "<leader>sb", function()
    Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "<leader>sc", function()
    Snacks.picker.commands()
end, { desc = "Commands" })

map("n", "<leader>sd", function()
    Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

map("n", "<leader>sf", function()
    Snacks.picker.files()
end, { desc = "Files" })

map("n", "<leader>s.", search_hidden_files, { desc = "[.] Hidden Files)" })

map("n", "<leader>sg", function()
    Snacks.picker.git_files()
end, { desc = "Git Files" })

map("n", "<leader>sh", function()
    Snacks.picker.help()
end, { desc = "Help" })

map("n", "<leader>sk", function()
    Snacks.picker.keymaps()
end, { desc = "Keymaps" })

map("n", "<leader>sl", function()
    Snacks.picker.grep()
end, { desc = "Live grep" })

map("n", "<leader>sn", find_config_files, { desc = "Neovim Files" })
map("n", "<leader>so", grep_open_files, { desc = "Open Files" })

map("n", "<leader>sr", function()
    Snacks.picker.recent()
end, { desc = "Recent Files" })

map({ "n", "v" }, "<leader>sw", function()
    Snacks.picker.grep_word()
end, { desc = "Word" })

map("n", "<leader>s/", search_current_buffer, { desc = "Current buffer" })
map("n", "<leader>st", search_todo_comments, { desc = "Todo Comments" })
