--[[ Code Companion Keymaps ]]

local map = vim.keymap.set

map({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "Actions" })
map("v", "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", { desc = "Insert" })
map("v", "<leader>ae", ":'<,'>CodeCompanion<cr>", { desc = "Edit Selection" })
map("n", "<leader>ae", ":.CodeCompanion<cr>", { desc = "Edit Line" })

map({ "n", "v" }, "<leader>an", function()
    require("codecompanion").chat()
end, { desc = "New chat" })

map({ "n", "v" }, "<leader>at", function()
    require("codecompanion").toggle()
end, { desc = "Open/Close" })

--[[ Copilot ]]

map("i", "<M-y>", function()
    require("copilot.suggestion").accept()
end, { desc = "Accept Copilot suggestion" })

map("i", "<M-n>", function()
    require("copilot.suggestion").next()
end, { desc = "Next Copilot suggestion" })

map("i", "<M-p>", function()
    require("copilot.suggestion").prev()
end, { desc = "Previous Copilot suggestion" })

map("i", "<M-e>", function()
    require("copilot.suggestion").dismiss()
end, { desc = "Dismiss Copilot suggestion" })
