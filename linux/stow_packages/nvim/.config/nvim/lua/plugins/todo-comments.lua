return {
    -- NOTE: some text
    -- WARN: some text
    --
    -- TODO: some text
    -- IMPL: some text
    -- FIX: some text
    -- REFACTOR: some text
    --
    -- REVIEW: some text
    -- TEST: some text
    -- PERF: some text
    --
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module 'todo-comments'
    ---@type TodoOptions
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        signs = true,
        keywords = {
            FIX = { icon = " ", color = "error", alt = { "fix" } },

            WARN = { icon = " ", color = "warning", alt = { "warn" } },
            IMPL = { icon = "", color = "warning", alt = { "impl" } },
            REFACTOR = { icon = "", color = "warning", alt = { "refactor" } }, -- nf-fa-gear

            NOTE = { icon = "", color = "info", alt = { "note" } },
            TODO = { icon = " ", color = "info", alt = { "todo" } },

            REVIEW = { icon = " ", color = "hint", alt = { "review" } },
            PERF = { icon = "", color = "hint", alt = { "perf" } },
            TEST = { icon = "", color = "hint", alt = { "test" } },
        },
        colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
            test = { "Identifier", "#FF00FF" },
        },
    },
}
