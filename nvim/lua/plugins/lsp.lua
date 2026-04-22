return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "saghen/blink.cmp",
        "mason-org/mason.nvim",
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local methods = vim.lsp.protocol.Methods
        local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

        local function has_document_highlight_client(bufnr, excluding_client_id)
            for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
                if
                    client.id ~= excluding_client_id
                    and client:supports_method(methods.textDocument_documentHighlight, bufnr)
                then
                    return true
                end
            end

            return false
        end

        vim.diagnostic.config({
            virtual_text = {
                format = function(_)
                    return ""
                end,
            },
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
            underline = { severity = { min = vim.diagnostic.severity.WARN } },
            severity_sort = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                -- Highlight references under the cursor after a delay; highlights clear on cursor move.
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client:supports_method(methods.textDocument_documentHighlight, event.buf) then
                    vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = event.buf })

                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = function(event2)
                            if has_document_highlight_client(event2.buf, event2.data.client_id) then
                                return
                            end

                            if vim.api.nvim_buf_is_valid(event2.buf) then
                                vim.api.nvim_buf_call(event2.buf, vim.lsp.buf.clear_references)
                            end

                            vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = event2.buf })
                        end,
                    })
                end
            end,
        })

        -- Enable language servers (auto-installed). See :help lsp-config for customization.
        ---@type table<string, vim.lsp.Config>
        local servers = {
            -- Python
            basedpyright = {
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                        },
                    },
                },
            },
            -- Rust
            rust_analyzer = {
                capabilities = {
                    offsetEncoding = { "utf-16" },
                },
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            enable = true,
                            command = "clippy",
                        },
                        cargo = {
                            allFeatures = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
            -- C/C++
            clangd = {
                cmd = { "clangd", "--background-index" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
            },
            -- Lua
            lua_ls = {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                            path ~= vim.fn.stdpath("config")
                            and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                        then
                            return
                        end
                    end
                    ---@diagnostic disable-next-line
                    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                        runtime = {
                            version = "LuaJIT",
                            path = { "lua/?.lua", "lua/?/init.lua" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
                                "${3rd}/luv/library",
                                "${3rd}/busted/library",
                            }),
                        },
                    })
                end,
                settings = {
                    Lua = {},
                },
            },
            jsonls = {},
            yamlls = {},
            bashls = {},
            taplo = {}, -- TOML
            cmake = {},
            dockerls = {},
        }

        for name, server in pairs(servers) do
            server.capabilities = vim.tbl_deep_extend("force", capabilities, server.capabilities or {})
            vim.lsp.config(name, server)
            vim.lsp.enable(name)
        end
    end,
}
