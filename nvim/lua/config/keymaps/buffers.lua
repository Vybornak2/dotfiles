--[[ Buffers ]]
local map = vim.keymap.set

local function next_buffer()
    vim.cmd.bnext()
end

local function prev_buffer()
    vim.cmd.bprevious()
end

-- Scratch buffer keymap
map("n", "<leader>be", function()
    Snacks.scratch()
end, { desc = "Scratch Buffer" })

-- Navigation keymaps
map("n", "<leader>bn", next_buffer, { desc = "Next Buffer" })
map("n", "<leader>bp", prev_buffer, { desc = "Prev Buffer" })
map("n", "<leader>bb", "<C-^>", { desc = "Switch to Other Buffer" })

map("n", "<leader>bs", function()
    Snacks.picker.buffers()
end, { desc = "Search" })

map("n", "<leader>br", function()
    Snacks.picker.buffers({ sort_lastused = true })
end, { desc = "Recent Buffers" })

map("n", "<leader>bR", function()
    vim.cmd("edit!")
end, { desc = "Reload" })

-- Delete keymaps
map("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map("n", "<leader>bD", function()
    Snacks.bufdelete.all()
end, { desc = "Delete All Buffers" })

map("n", "<leader>bo", function()
    Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
