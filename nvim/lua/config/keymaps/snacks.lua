-- [[ Snacks Keymaps ]]

-- These are already closures; they are deferred correctly.
local find_config_files = function()
    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end

local grep_open_files = function()
    Snacks.picker.grep_buffers()
end

local search_current_buffer = function()
    Snacks.picker.lines()
end

-- CRITICAL: Wrap these to prevent eager loading of the explorer module
vim.keymap.set("n", "<leader>et", function() Snacks.explorer.open() end, { desc = "[T]oggle" })
vim.keymap.set("n", "<leader>el", function() Snacks.explorer.reveal() end, { desc = "[R]eveal" })

-- Wrap these references to prevent the Snacks metatable from triggering on boot
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.buffers() end, { desc = "[B]uffers" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.commands() end, { desc = "[C]ommands" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "[D]iagnostics" })
vim.keymap.set("n", "<leader>sf", function() Snacks.picker.files() end, { desc = "[F]iles" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.git_files() end, { desc = "[G]it Files" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "[H]elp" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "[K]eymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.grep() end, { desc = "[L]ive grep" })
vim.keymap.set("n", "<leader>sn", find_config_files, { desc = "[N]eovim files" })
vim.keymap.set("n", "<leader>so", grep_open_files, { desc = "[O]pen Files" })
vim.keymap.set("n", "<leader>sr", function() Snacks.picker.recent() end, { desc = "[R]ecent Files" })
vim.keymap.set({ "n", "v" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "[W]ord" })
vim.keymap.set("n", "<leader>s/", search_current_buffer, { desc = "[/] Current buffer" })
