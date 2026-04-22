--[[ UI keymaps ]]

map = vim.keymap.set

map("n", "<leader>ub", function()
    require("gitsigns").toggle_current_line_blame()
end, { desc = "Git Blame" })

map("n", "<leader>ud", vim.diagnostic.setloclist, { desc = "Diagnostics" })

map("n", "<leader>uc", function()
    require("copilot.suggestion").toggle_auto_trigger()
end, { desc = "Copilot Suggestions" })

map("n", "<leader>uw", function()
    require("gitsigns").toggle_word_diff()
end, { desc = "Word diff" })
