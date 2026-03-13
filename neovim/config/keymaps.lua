-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Close terminal with <C-/> in terminal mode
-- (Snacks-managed terminals are hidden; others close the window)
local function close_terminal()
  local buf = vim.api.nvim_get_current_buf()
  for _, terminal in ipairs(Snacks.terminal.list()) do
    if terminal.buf == buf then
      terminal:hide()
      return
    end
  end
  -- Close window for terminals not managed by Snacks
  vim.cmd("close")
end
vim.keymap.set("t", "<C-/>", close_terminal, { desc = "Close Terminal" })
vim.keymap.set("t", "<C-_>", close_terminal, { desc = "Close Terminal (same as C-/)" })

-- copilot.lua accept keymaps
vim.keymap.set("i", "<C-Right>", function()
  require("copilot.suggestion").accept_word()
end, { silent = true })

vim.keymap.set("i", "<C-Enter>", function()
  require("copilot.suggestion").accept_line()
end)
