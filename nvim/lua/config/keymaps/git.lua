--[[ Git Keymaps ]]
--
-- Includes:
--   Neogit
--   Gitsigns
--   Diffview
--
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Git" })

vim.keymap.set("n", "]c", function()
    if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
    else
        require("gitsigns").nav_hunk("next")
    end
end, { desc = "Next Change" })

vim.keymap.set("n", "[c", function()
    if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
    else
        require("gitsigns").nav_hunk("prev")
    end
end, { desc = "Prev Change" })

vim.keymap.set("n", "<leader>gs", function()
    require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })

vim.keymap.set("n", "<leader>gr", function()
        require("gitsigns").reset_hunk()
    end,
    { desc = "Reset hunk" })

vim.keymap.set("v", "<leader>gs", function()
    require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })

vim.keymap.set("v", "<leader>gr", function()
    require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })

vim.keymap.set("n", "<leader>gS", function()
    require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })

vim.keymap.set("n", "<leader>gR", function()
    require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })

vim.keymap.set("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })

vim.keymap.set("n", "<leader>gi", function()
    require("gitsigns").preview_hunk_inline()
end, { desc = "Preview Inline" })

vim.keymap.set({ "o", "x" }, "ih", function()
    require("gitsigns").select_hunk()
end, { desc = "Select Hunk" })

vim.keymap.set("n", "<leader>gd", function()
    require("gitsigns").diffthis()
end, { desc = "Diff this" })

vim.keymap.set("n", "<leader>gD", function()
    require("gitsigns").diffthis("~")
end, { desc = "Diff staged" })

vim.keymap.set("n", "<leader>gq", function()
    require("gitsigns").setqflist()
end, { desc = "Quickfix hunks" })

vim.keymap.set("n", "<leader>gQ", function()
    require("gitsigns").setqflist("all")
    vim.cmd("copen")
end, { desc = "Quickfix all hunks" })

vim.keymap.set("n", "<leader>gb", function()
    require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })

-- Diffview
vim.keymap.set("n", "<leader>gv", function()
    ---@diagnostic disable-next-line
    require("diffview").open()
end, { desc = "Diffview" })

vim.keymap.set("n", "<leader>gV", function()
    require("diffview").open({ "--", vim.fn.expand("%") })
end, { desc = "DiffView file" })

vim.keymap.set("n", "<leader>gh", function()
    require("diffview").file_history(nil, { vim.fn.expand("%") })
end, { desc = "File History" })
