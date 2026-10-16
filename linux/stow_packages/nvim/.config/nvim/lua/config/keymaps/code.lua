--[[ Code ]]

local map = vim.keymap.set

--[[ NeoGen ]]
map("n", "<leader>cd", function()
    require("neogen").generate()
end, { desc = "Docsrting" })

--[[ Conform ]]
map({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
