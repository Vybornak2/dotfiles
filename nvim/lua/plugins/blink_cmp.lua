return { -- Autocompletion
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        cmdline = { enabled = false },
        keymap = {
            -- `:help ins-completion`
            -- :h blink-cmp-config-keymap
            preset = "super-tab",
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            keyword = { range = 'full' },
            trigger = {
                prefetch_on_insert = true,
            },
            ghost_text = {
                enabled = false,
            },
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 500
            },
            menu = {
                auto_show = true,
                auto_show_delay_ms = 500,
                draw = {
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        { "kind_icon", "kind" }
                    },
                }
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            -- default = { "lsp", "path", "snippets", "copilot", "codecompanion" },
            providers = {
                -- Copilot suggestions are handled via `copilot.lua`
                -- enable correct `default` !!! if enabled
                -- copilot = {
                -- 	name = "copilot",
                -- 	module = "blink-cmp-copilot",
                -- 	min_keyword_length = 1,
                -- 	score_offset = 0,
                -- 	async = true,
                -- },
                --
                -- codecompanion = {
                -- 	name = "CodeCompanion",
                -- 	module = "codecompanion.providers.completion.blink",
                -- 	enabled = true,
                -- },
            },
        },

        snippets = { preset = "default" },
        fuzzy = { implementation = "prefer_rust_with_warning" },

        -- Shows a signature help window while you type arguments for a function
        signature = { enabled = true },
    },
}
