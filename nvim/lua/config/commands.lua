--[[ Commands ]]

vim.api.nvim_create_user_command("Wrap", function(opts)
    -- 1. Parse arguments (defaults: width=80, symbol='#')
    local fargs = opts.fargs or {}
    local total_width = tonumber(fargs[1]) or 80
    local provided = vim.trim(fargs[2] or "")
    local commentstring = vim.bo.commentstring or "# %s"
    local symbol = provided ~= "" and provided or vim.trim(commentstring:match("^(.-)%%s") or "#")
    local space_around_text = 1

    -- 2. Get and trim the current line
    local line = vim.api.nvim_get_current_line()
    local text = vim.trim(line)
    if text == "" then
        return
    end

    -- 3. Math for centering
    local text_len = #text + (space_around_text * 2)
    local padding_total = total_width - text_len

    -- require at least one character of padding on both sides so symbols can appear
    if padding_total < 2 then
        vim.notify("Not enough space to place symbols on both sides for width " .. total_width, vim.log.levels.WARN)
        return
    end

    local left_pad = math.floor(padding_total / 2)
    local right_pad = padding_total - left_pad

    -- 4. Build and set the line (repeat exact symbol units)
    local symbol_len = #symbol

    -- require at least one full symbol on each side
    local min_required = symbol_len * 2
    if padding_total < min_required then
        vim.notify(
            "Not enough space to place symbol '" .. symbol .. "' on both sides for width " .. total_width,
            vim.log.levels.WARN
        )
        return
    end

    local left_pad_chars = math.floor(padding_total / 2)
    local right_pad_chars = padding_total - left_pad_chars

    local left_count = math.max(1, math.floor(left_pad_chars / symbol_len))
    local right_count = math.max(1, math.floor(right_pad_chars / symbol_len))

    local used_chars = (left_count + right_count) * symbol_len
    local remaining = padding_total - used_chars
    local left_extra_spaces = math.floor(remaining / 2)
    local right_extra_spaces = remaining - left_extra_spaces

    local left_fill = string.rep(symbol, left_count) .. string.rep(" ", left_extra_spaces)
    local right_fill = string.rep(" ", right_extra_spaces) .. string.rep(symbol, right_count)

    local new_line = left_fill
        .. string.rep(" ", space_around_text)
        .. text
        .. string.rep(" ", space_around_text)
        .. right_fill

    -- Ensure final line length equals requested width (trim or pad using first char of symbol)
    if #new_line > total_width then
        new_line = string.sub(new_line, 1, total_width)
    elseif #new_line < total_width then
        local pad_char = (symbol ~= "" and symbol:sub(1, 1)) or " "
        new_line = new_line .. string.rep(pad_char, total_width - #new_line)
    end

    vim.api.nvim_set_current_line(new_line)
end, {
    nargs = "*",
    desc = "Center text and wrap with symbols: :Wrap <width> <symbol>",
})

vim.api.nvim_create_user_command("Wrap2", function(opts)
    -- 1. Parse arguments (defaults: width=80, symbol='#')
    local fargs = opts.fargs or {}
    local total_width = tonumber(fargs[1]) or 80
    local provided = vim.trim(fargs[2] or "")
    local commentstring = vim.bo.commentstring or "# %s"
    local symbol = provided ~= "" and provided or vim.trim(commentstring:match("^(.-)%%s") or "#")
    local line = vim.api.nvim_get_current_line()
    local text = vim.trim(line)
    if text == "" then
        return
    end
    -- Calculate how many symbols are needed for the vertical bar
    local symbol_len = vim.fn.strdisplaywidth(symbol)
    local repeat_count = math.floor((total_width + symbol_len - 1) / symbol_len)
    local border = string.rep(symbol, repeat_count)
    -- Center the text inside the border
    local line_len = vim.fn.strdisplaywidth(text)
    if line_len < total_width then
        local pad = total_width - line_len
        local left = math.floor(pad / 2) - symbol_len
        commented_line = commentstring:gsub("%%s", string.rep(" ", left) .. text)
    end
    -- Replace current line with: border, commented_line, border
    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, row - 1, row, false, { border, commented_line, border })
end, {
    nargs = "*",
    desc = "Vertically wrap text with comment chars: :WrapVertical <width> <symbol>",
})

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
