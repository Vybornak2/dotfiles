--[[ UI keymaps ]]
--
vim.keymap.set("n", "<leader>ub", function()
    require("gitsigns").toggle_current_line_blame()
end, { desc = "Git Blame" })

vim.keymap.set("n", "<leader>ud",
    vim.diagnostic.setloclist,
    { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>uc", function()
    require("copilot.suggestion").toggle_auto_trigger()
end, { desc = "Copilot Suggestions" })

vim.keymap.set("n", "<leader>uw", function()
    require("gitsigns").toggle_word_diff()
end, { desc = "Word diff" })
