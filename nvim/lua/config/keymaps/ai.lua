--[[ Code Companion Keymaps ]]

vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "Actions" })
vim.keymap.set("v", "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", { desc = "Insert" })
vim.keymap.set("v", "<leader>ae", ":'<,'>CodeCompanion<cr>", { desc = "Edit Selection" })
vim.keymap.set("n", "<leader>ae", ":.CodeCompanion<cr>", { desc = "Edit Line" })

vim.keymap.set({ "n", "v" }, "<leader>an", function()
    require("codecompanion").chat()
end, { desc = "New chat" })

vim.keymap.set({ "n", "v" }, "<leader>at", function()
    require("codecompanion").toggle()
end, { desc = "Open/Close" })

--[[ Copilot ]]

vim.keymap.set("i", "<M-y>", function()
    require("copilot.suggestion").accept()
end, { desc = "Accept Copilot suggestion" })

vim.keymap.set("i", "<M-n>", function()
    require("copilot.suggestion").next()
end, { desc = "Next Copilot suggestion" })

vim.keymap.set("i", "<M-p>", function()
    require("copilot.suggestion").prev()
end, { desc = "Previous Copilot suggestion" })

vim.keymap.set("i", "<M-e>", function()
    require("copilot.suggestion").dismiss()
end, { desc = "Dismiss Copilot suggestion" })

