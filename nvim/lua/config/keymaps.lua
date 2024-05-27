-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Key map
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<ESC>", { silent = true, desc = "Exit the insert mode" }) -- desc can be retrieved by the which-key plugin
vim.keymap.set("n", "<leader>w", ":w<Enter>", { desc = "Save" })
