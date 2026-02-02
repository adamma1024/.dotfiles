local formatter = require("formatter")

formatter.setup({
  logging = true,
  log_level = "info",
  filetypes = {
    python = { "black", "isort", "autopep8" }, -- Format with black, then isort, then autopep8
    -- You can add other filetypes and formatters here
  },
})

-- Keybindings (optional, add to your keybindings file or init.lua)
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Format<CR>", { noremap = true, silent = true }) -- Format current buffer
vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>Format! <CR>", { noremap = true, silent = true }) -- Force format, useful for debugging
