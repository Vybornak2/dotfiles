--[[ Code ]]

--[[ NeoGen ]]
vim.keymap.set("n", "<leader>cd", function()
    require("neogen").generate()
end, { desc = "Docsrting" })

--[[ Conform ]]
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
