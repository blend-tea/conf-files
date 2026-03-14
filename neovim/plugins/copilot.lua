return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = false,
        accept_word = false,
        accept_line = false,
      },
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    local suggestion = require("copilot.suggestion")

    -- Accept the next word from the Copilot suggestion
    vim.keymap.set("i", "<C-l>", function()
      suggestion.accept_word()
    end, { silent = true })

    -- Dismiss the suggestion when leaving insert mode
    vim.api.nvim_create_autocmd("InsertLeave", {
      callback = function()
        suggestion.dismiss()
      end,
    })

    -- Dismiss the suggestion when blink.cmp menu opens
    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkCmpMenuOpen",
      callback = function()
        suggestion.dismiss()
      end,
    })
  end,
}
