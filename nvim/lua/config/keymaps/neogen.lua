--[[NeoGen]]

vim.keymap.set("n", "<leader>cng", require("neogen").generate, { desc = "[G]enerate annotation" })
vim.keymap.set("i", "<leader>cnn", require("neogen").jump_next, { desc = "[N]ext Jump" })
vim.keymap.set("i", "<leader>cnp", require("neogen").jump_prev, { decs = "[P]revious Jump" })
