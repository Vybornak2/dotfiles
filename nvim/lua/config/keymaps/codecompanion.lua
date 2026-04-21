--[[Code Companion Keymaps]]

vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "Actions" })
vim.keymap.set("v", "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", { desc = "Insert" })
vim.keymap.set("v", "<leader>ae", ":'<,'>CodeCompanion<cr>", { desc = "Edit" })
vim.keymap.set("v", "<leader>ar", ":'<,'>CodeCompanion refactor this<cr>", { desc = "Refactor" })

vim.keymap.set({ "n", "v" }, "<leader>an", function()
    require("codecompanion").chat()
end, { desc = "New chat" })

vim.keymap.set({ "n", "v" }, "<leader>at", function()
    require("codecompanion").toggle()
end, { desc = "Toggle" })

-- CLI

vim.keymap.set({ "n", "v" }, "<LocalLeader>aco",
    "<cmd>CodeCompanionCLI<cr>",
    { desc = "Open" })

vim.keymap.set({ "n", "v" }, "<leader>acp", function()
    return require("codecompanion").cli({ prompt = true })
end, { desc = "Prompt" })

vim.keymap.set({ "n", "v" }, "<LocalLeader>aci", function()
    return require("codecompanion").cli("#{this}", { focus = false })
end, { desc = "Insert" })

vim.keymap.set("n", "<LocalLeader>acd", function()
    return require("codecompanion").cli(
        "#{diagnostics} Can you fix these?",
        { focus = false, submit = true }
    )
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<LocalLeader>act", function()
    return require("codecompanion").cli(
        "#{terminal} Sharing the output from the terminal. Can you fix it?",
        { focus = false, submit = true }
    )
end, { desc = "Terminal" })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
