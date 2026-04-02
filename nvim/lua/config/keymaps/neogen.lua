--[[NeoGen]]

vim.keymap.set("n", "<leader>cd", function()
    require("neogen").generate()
end, { desc = "[D]ocsrting" })

vim.keymap.set("i", "<C-l>", function()
    require("neogen").jump_next()
end, { desc = "[N]ext jump", noremap = true })

vim.keymap.set("i", "<C-h>", function()
    require("neogen").jump_prev()
end, { desc = "[P]rev Jump", noremap = true })
