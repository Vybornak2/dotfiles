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
            NOTE = { icon = "", color = "note", alt = { "note" } },
            WARN = { icon = " ", color = "warn", alt = { "warn" } },

            TODO = { icon = " ", color = "todo", alt = { "todo" } },
            IMPL = { icon = "", color = "impl", alt = { "impl" } }, -- nf-fa-wrench
            FIX = { icon = " ", color = "fix", alt = { "fix" } },
            REFACTOR = { icon = "", color = "refactor", alt = { "refactor" } }, -- nf-fa-gear

            REVIEW = { icon = " ", color = "review", alt = { "review" } }, -- nf-fa-pencil
            PERF = { icon = "", color = "perf", alt = { "perf" } },
            TEST = { icon = "", color = "test", alt = { "test" } },
        },
        colors = {
            -- error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            -- warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            -- info = { "DiagnosticInfo", "#2563EB" },
            -- hint = { "DiagnosticHint", "#10B981" },
            -- default = { "Identifier", "#7C3AED" },
            -- test = { "Identifier", "#FF00FF" }

            fix = { "DiagnosticError", "#f38ba8" },
            warn = { "DiagnosticWarn", "#fab387" },
            note = { "DiagnosticHint", "#b4befe" },
            todo = { "DiagnosticInfo", "#f9e2af" },

            impl = { "Keyword", "#cba6f7" },
            refactor = { "Function", "#94e2d5" },
            review = { "Special", "#f9e2af" },
            test = { "Identifier", "#f5c2e7" },
            perf = { "String", "#a6e3a1" },
        },
    },
}
