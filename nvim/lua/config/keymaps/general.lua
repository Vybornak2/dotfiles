--[[ General Keymmaps ]]

-- [[ General keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Arrow key hints ]]
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- [[ Window navigation ]]
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Diagnostics ]]
vim.keymap.set("n", "<leader>td", vim.diagnostic.setloclist, { desc = "[D]iagnostics" })
vim.keymap.set("n", "L", function()
  vim.diagnostic.open_float({
    scope = "line",      -- Show all errors on the current line
    focusable = false,   -- Let's you keep typing/moving without getting stuck in the window
    border = "rounded",  -- Looks better on modern terminals like Kitty
  })
end, { desc = "Line Diagnostics" })

--[[ Neovim ]]
vim.keymap.set("n", "<leader>nr", function()
    for name, _ in pairs(package.loaded) do
        if name:match("^plugins") or name:match("^config") then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
    vim.notify("Config Reloaded!")
end, { desc = "[R]eload" })
vim.keymap.set("n", "<leader>nl", "<cmd>Lazy<cr>", { desc = "[L]azy" })
vim.keymap.set("n", "<leader>nm", "<cmd>Mason<cr>", { desc = "[M]ason" })


--[[ Utils ]]
vim.keymap.set("n", "<leader>ur", function()
    vim.cmd("edit!")
end, { desc = "[R]eload" })

--[[ Conform ]]
vim.keymap.set("", "<leader><leader>", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })

--[[ NeoGen ]]
vim.keymap.set("n", "<leader>cd", function()
    require("neogen").generate()
end, { desc = "[D]ocsrting" })

-- [[ Center text with symbols ]]
vim.api.nvim_create_user_command("Wrap", function(opts)
  -- 1. Parse arguments (defaults: symbol='#', width=80)
  local fargs = opts.fargs
  local commentstring = vim.bo.commentstring or '# %s'
  local symbol = commentstring:match('^(.-)%%s') or '#'
  symbol = vim.trim(symbol)
  local total_width = tonumber(fargs[2]) or 80
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
  desc = "Center text and wrap with symbols: :Wrap <symbol> <width>",
})
