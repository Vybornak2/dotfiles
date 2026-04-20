return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, 
            },
        },
        presets = {
            bottom_search = false,    -- Changed to false: Now `/` search will be a floating popup!
            command_palette = true,   -- Keeps the `:` cmdline looking like a modern palette
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = true,    -- Changed to true: Gives your `K` hover window rounded borders
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
