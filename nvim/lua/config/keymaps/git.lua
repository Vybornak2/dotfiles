--[[ Git Keymaps ]]
--
-- Includes:
--   Neogit
--   Gitsigns
--   Diffview
--
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "[G]it" })

vim.keymap.set("n", "]c", function()
    if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
    else
        require("gitsigns").nav_hunk("next")
    end
end, { desc = "Next [C]hange" })

vim.keymap.set("n", "[c", function()
    if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
    else
        require("gitsigns").nav_hunk("prev")
    end
end, { desc = "Prev [C]hange" })

vim.keymap.set("n", "<leader>gs", function()
    require("gitsigns").stage_hunk()
end, { desc = "[S]tage hunk" })

vim.keymap.set("n", "<leader>gr", function()
        require("gitsigns").reset_hunk()
    end,
    { desc = "[R]eset hunk" })

vim.keymap.set("v", "<leader>gs", function()
    require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "[S]tage hunk" })

vim.keymap.set("v", "<leader>gr", function()
    require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "[R]eset hunk" })

vim.keymap.set("n", "<leader>gS", function()
    require("gitsigns").stage_buffer()
end, { desc = "[S]tage buffer" })

vim.keymap.set("n", "<leader>gR", function()
    require("gitsigns").reset_buffer()
end, { desc = "[R]eset buffer" })

vim.keymap.set("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
end, { desc = "[P]review hunk" })

vim.keymap.set("n", "<leader>gi", function()
    require("gitsigns").preview_hunk_inline()
end, { desc = "Preview [I]nline" })

vim.keymap.set({ "o", "x" }, "ih", function()
    require("gitsigns").select_hunk()
end, { desc = "Select [H]unk" })

vim.keymap.set("n", "<leader>gd", function()
    require("gitsigns").diffthis()
end, { desc = "[D]iff this" })

vim.keymap.set("n", "<leader>gD", function()
    require("gitsigns").diffthis("~")
end, { desc = "[D]iff staged" })

vim.keymap.set("n", "<leader>gq", function()
    require("gitsigns").setqflist()
end, { desc = "[Q]uickfix hunks" })

vim.keymap.set("n", "<leader>gQ", function()
    require("gitsigns").setqflist("all")
    vim.cmd("copen")
end, { desc = "[Q]uickfix all hunks" })

vim.keymap.set("n", "<leader>gb", function()
    require("gitsigns").blame_line({ full = true })
end, { desc = "[B]lame line" })

-- Toggle options
vim.keymap.set("n", "<leader>tb", function()
    require("gitsigns").toggle_current_line_blame()
end, { desc = "Git [B]lame" })

vim.keymap.set("n", "<leader>tw", function()
    require("gitsigns").toggle_word_diff()
end, { desc = "[W]ord diff" })

-- Diffview
vim.keymap.set("n", "<leader>gv", function()
    ---@diagnostic disable-next-line
    require("diffview").open()
end, { desc = "Diff[v]iew" })

vim.keymap.set("n", "<leader>gV", function()
    require("diffview").open({ "--", vim.fn.expand("%") })
end, { desc = "Diff[V]iew file" })

vim.keymap.set("n", "<leader>gh", function()
    require("diffview").file_history(nil, { vim.fn.expand("%") })
end, { desc = "File [H]istory" })
