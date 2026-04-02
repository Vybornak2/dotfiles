--[[ Autocmd ]]

-- Diagnostic config. See `:help vim.diagnostic.Opts`
vim.diagnostic.config({
    float = { border = "rounded", source = "if_many" },
    underline = { severity = { min = 2 } }, -- 2 is the shorthand for 'WARN'
    jump = { on_jump = function() vim.diagnostic.open_float({ focus = false }) end },
})

-- Highlight text on yank. See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Buffers to be removed from sessions
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "NeogitStatus",
        "NeogitPopup",
        "NeogitCommitMessage",
        "codecompanion",
        "CodeCompanion",
        "minifiles",
    },
    callback = function(args)
        vim.bo[args.buf].buflisted = false
        vim.bo[args.buf].bufhidden = "wipe"
    end,
})
