--[[ Git Keymaps ]]
--
-- Includes:
--   Neogit
--   Gitsigns
--   Diffview
--
local map = vim.keymap.set

map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Git" })

map("n", "]c", function()
    if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
    else
        require("gitsigns").nav_hunk("next")
    end
end, { desc = "Next Change" })

map("n", "[c", function()
    if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
    else
        require("gitsigns").nav_hunk("prev")
    end
end, { desc = "Prev Change" })

map("n", "<leader>gs", function()
    require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })

map("n", "<leader>gr", function()
    require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })

map("v", "<leader>gs", function()
    require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })

map("v", "<leader>gr", function()
    require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })

map("n", "<leader>gS", function()
    require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })

map("n", "<leader>gR", function()
    require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })

map("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })

map("n", "<leader>gi", function()
    require("gitsigns").preview_hunk_inline()
end, { desc = "Preview Inline" })

map({ "o", "x" }, "ih", function()
    require("gitsigns").select_hunk()
end, { desc = "Select Hunk" })

map("n", "<leader>gd", function()
    require("gitsigns").diffthis()
end, { desc = "Diff this" })

map("n", "<leader>gD", function()
    require("gitsigns").diffthis("~")
end, { desc = "Diff staged" })

map("n", "<leader>gq", function()
    require("gitsigns").setqflist()
end, { desc = "Quickfix hunks" })

map("n", "<leader>gQ", function()
    require("gitsigns").setqflist("all")
    vim.cmd("copen")
end, { desc = "Quickfix all hunks" })

map("n", "<leader>gb", function()
    require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })

-- Diffview
map("n", "<leader>gv", function()
    ---@diagnostic disable-next-line
    require("diffview").open()
end, { desc = "Diffview" })

map("n", "<leader>gV", function()
    require("diffview").open({ "--", vim.fn.expand("%") })
end, { desc = "DiffView file" })

map("n", "<leader>gh", function()
    require("diffview").file_history(nil, { vim.fn.expand("%") })
end, { desc = "File History" })
