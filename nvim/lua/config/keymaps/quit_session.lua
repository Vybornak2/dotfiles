--[[ Quit / Session ]]

local map = vim.keymap.set

map("n", "<leader>qd", function()
    require("persistence").stop()
    vim.cmd.qa()
end, { desc = "Don't Save Current Session" })

map("n", "<leader>ql", function()
    require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

map("n", "<leader>qs", function()
    require("persistence").load()
end, { desc = "Restore Session" })

map("n", "<leader>qS", function()
    require("persistence").select()
end, { desc = "Select Session" })
