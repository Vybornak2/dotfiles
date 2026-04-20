return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    config = function()
        require("codecompanion").setup({
            prompt_library = {
                markdown = {
                    dirs = {
                        -- vim.fn.getcwd() .. "/.prompts",
                        "~/dotfiles/prompts",
                    },
                },
            },
            display = {
                chat = {
                    icons = {
                        chat_fold = " ",
                        chat_context = "📎️",
                    },
                    -- show_settings = true,
                    fold_reasoning = true,
                    show_reasoning = true,
                },
                diff = {
                    enabled = true,
                },
                action_palette = {
                    opts = {
                        show_preset_prompts = false,
                    },
                },
            },
            -- opts = {
            -- 	log_level = "DEBUG", -- TRACE|DEBUG|ERROR|INFO
            -- },
            adapters = {
                http = {
                    qwen_inline = function()
                        return require("codecompanion.adapters").extend("ollama", {
                            name = "qwen_inline",
                            schema = {
                                model = { default = "qwen2.5-coder:7b" },
                            },
                        })
                    end,
                    copilot_chat = function()
                        return require("codecompanion.adapters").extend("copilot", {
                            schema = {
                                model = { default = "gpt-5-mini" },
                            },
                        })
                    end,
                    copilot_inline = function()
                        return require("codecompanion.adapters").extend("copilot", {
                            schema = {
                                model = { default = "gpt-4.1" },
                            },
                        })
                    end,
                    gemini_vertex_free = function()
                        return require("codecompanion.adapters").extend("gemini_cli", {
                            defaults = {
                                auth_method = "vertex-ai",
                            },
                            env = {
                                GOOGLE_GENAI_USE_VERTEXAI = "true",
                                GOOGLE_CLOUD_PROJECT = "cmd:secret-tool lookup name gemini_project_free",
                                GOOGLE_CLOUD_LOCATION = "europe-central2",
                                GEMINI_MODEL = "gemini-2.5-flash",
                            },
                            schema = {
                                model = { default = "gemini-2.5-flash" },
                            },
                        })
                    end,
                    gemini_vertex_chat_billing = function()
                        return require("codecompanion.adapters").extend("gemini_cli", {
                            defaults = {
                                auth_method = "vertex-ai",
                            },
                            env = {
                                GOOGLE_GENAI_USE_VERTEXAI = "true",
                                GOOGLE_CLOUD_PROJECT = "cmd:secret-tool lookup name gemini_project_billing",
                                GOOGLE_CLOUD_LOCATION = "europe-central2",
                                GEMINI_MODEL = "gemini-2.5-pro",
                            },
                            schema = {
                                model = { default = "gemini-2.5-pro" },
                            },
                        })
                    end,
                    gemini_chat_free = function()
                        return require("codecompanion.adapters").extend("gemini", {
                            schema = {
                                model = { default = "gemini-2.5-flash" },
                                auth_method = { default = "gemini-api-key" },
                            },
                            env = {
                                api_key = "cmd:secret-tool lookup name gemini_api_key_free",
                            },
                        })
                    end,
                    gemini_inline_free = function()
                        return require("codecompanion.adapters").extend("gemini", {
                            schema = {
                                model = { default = "gemini-2.5-flash" },
                                auth_method = { default = "gemini-api-key" },
                            },
                            env = {
                                api_key = "cmd:secret-tool lookup name gemini_api_key_free",
                            },
                        })
                    end,
                },
            },
            interactions = {
                chat = {
                    -- adapter = "gemini_vertex_free",
                    -- adapter = "gemini_vertex_chat_billing",
                    -- adapter = "gemini_chat_free",
                    adapter = "copilot_chat",
                },
                inline = {
                    -- adapter = "gemini_inline_free",
                    adapter = "copilot_inline",
                    -- adapter = "qwen_inline",
                },
                cli = {
                    agent = "copilot",
                    -- opts = {
                    -- 	auto_insert = true,
                    -- },
                    agents = {
                        copilot = {
                            cmd = "copilot",
                            args = {},
                            description = "Copilot CLI",
                            provider = "terminal",
                        },
                    },
                },
            },
        })

        -- Autocmd: Unlist codecompanion buffers (if desired)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "codecompanion",
                "CodeCompanion",
            },
            callback = function(args)
                vim.bo[args.buf].buflisted = false
                vim.bo[args.buf].bufhidden = "wipe"
            end,
        })
    end,
}
