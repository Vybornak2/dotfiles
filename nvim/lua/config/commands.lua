--[[ Commands ]]

vim.api.nvim_create_user_command("Wrap", function(opts)
    -- 1. Parse arguments (defaults: width=80, symbol='#')
    local fargs = opts.fargs or {}
    local total_width = tonumber(fargs[1]) or 80
    local provided = vim.trim(fargs[2] or "")
    local commentstring = vim.bo.commentstring or '# %s'
    local symbol = provided ~= "" and provided or vim.trim(commentstring:match('^(.-)%%s') or '#')
    local space_around_text = 1

    -- 2. Get and trim the current line
    local line = vim.api.nvim_get_current_line()
    local text = vim.trim(line)
    if text == "" then return end

    -- 3. Math for centering
    local text_len = #text + (space_around_text * 2)
    local padding_total = total_width - text_len

    if padding_total <= 0 then
        vim.notify("Text is too long for width " .. total_width, vim.log.levels.WARN)
        return
    end

    local left_pad = math.floor(padding_total / 2)
    local right_pad = padding_total - left_pad

    -- 4. Build and set the line
    local new_line = string.rep(symbol, left_pad)
        .. string.rep(" ", space_around_text)
        .. text
        .. string.rep(" ", space_around_text)
        .. string.rep(symbol, right_pad)

    vim.api.nvim_set_current_line(new_line)
end, {
    nargs = "*",
    desc = "Center text and wrap with symbols: :Wrap <width> <symbol>",
})
