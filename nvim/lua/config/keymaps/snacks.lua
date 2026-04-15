-- [[ Snacks Keymaps ]]

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

--[[ Buffers ]]
vim.keymap.set("n", "<leader>bdt", function() Snacks.bufdelete() end, { desc = "[D]elete" })
vim.keymap.set("n", "<leader>bdo", function() Snacks.bufdelete.other() end, { desc = "[O]ther" })
vim.keymap.set("n", "<leader>bdA", function() Snacks.bufdelete.all() end, { desc = "[A]ll" })
vim.keymap.set("n", "<leader>be", function() Snacks.scratch() end, { desc = "[E]mpty" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "[N]ext" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "[P]rev" })
vim.keymap.set("n", "<leader>bc", "<C-6>", { desc = "[C]ycle" })
vim.keymap.set("n", "<leader>bs", function() Snacks.picker.buffers() end, { desc = "[S]earch" })
vim.keymap.set("n", "<leader>br", function()
    Snacks.picker.buffers({ sort_lastused = true })
end, { desc = "[R]ecent" })

--[[ Explorer]]
vim.keymap.set("n", "<leader>et", function() Snacks.explorer.open() end, { desc = "[T]oggle" })
vim.keymap.set("n", "<leader>el", function() Snacks.explorer.reveal() end, { desc = "[R]eveal" })

--[[ Search ]]
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.buffers() end, { desc = "[B]uffers" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.commands() end, { desc = "[C]ommands" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "[D]iagnostics" })
vim.keymap.set("n", "<leader>sf", function() Snacks.picker.files() end, { desc = "[F]iles" })
vim.keymap.set("n", "<leader>s.", search_hidden_files, { desc = "[.] Hidden Files)" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.git_files() end, { desc = "[G]it Files" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "[H]elp" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "[K]eymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.grep() end, { desc = "[L]ive grep" })
vim.keymap.set("n", "<leader>sn", find_config_files, { desc = "[N]eovim files" })
vim.keymap.set("n", "<leader>so", grep_open_files, { desc = "[O]pen Files" })
vim.keymap.set("n", "<leader>sr", function() Snacks.picker.recent() end, { desc = "[R]ecent Files" })
vim.keymap.set({ "n", "v" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "[W]ord" })
vim.keymap.set("n", "<leader>s/", search_current_buffer, { desc = "[/] Current buffer" })
vim.keymap.set("n", "<leader>st", search_todo_comments, { desc = "[T]odo Comments" })
