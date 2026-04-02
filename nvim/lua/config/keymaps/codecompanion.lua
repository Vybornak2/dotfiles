--[[Code Companion Keymaps]]

vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "[A]ctions" })
vim.keymap.set("v", "<leader>ai", "<cmd>CodeCompanionChat Add<cr>", { desc = "[I]nsert" })
vim.keymap.set("v", "<leader>ae", ":'<,'>CodeCompanion<cr>", { desc = "[E]dit" })
vim.keymap.set("v", "<leader>ar", ":'<,'>CodeCompanion refactor this<cr>", { desc = "[R]efactor" })

vim.keymap.set({ "n", "v" }, "<leader>an", function()
    require("codecompanion").chat()
end, { desc = "[N]ew chat" })

vim.keymap.set({ "n", "v" }, "<leader>at", function()
    require("codecompanion").toggle()
end, { desc = "[T]oggle" })

-- CLI

vim.keymap.set({ "n", "v" }, "<LocalLeader>aco",
    "<cmd>CodeCompanionCLI<cr>",
    { desc = "[O]pen" })

vim.keymap.set({ "n", "v" }, "<leader>acp", function()
    return require("codecompanion").cli({ prompt = true })
end, { desc = "[P]rompt" })

vim.keymap.set({ "n", "v" }, "<LocalLeader>aci", function()
    return require("codecompanion").cli("#{this}", { focus = false })
end, { desc = "[I]nsert" })

vim.keymap.set("n", "<LocalLeader>acd", function()
    return require("codecompanion").cli(
        "#{diagnostics} Can you fix these?",
        { focus = false, submit = true }
    )
end, { desc = "[D]iagnostics" })

vim.keymap.set("n", "<LocalLeader>act", function()
    return require("codecompanion").cli(
        "#{terminal} Sharing the output from the terminal. Can you fix it?",
        { focus = false, submit = true }
    )
end, { desc = "[T]erminal" })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
