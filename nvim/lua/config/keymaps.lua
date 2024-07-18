-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
-- desc can be retrieved by the which-key plugin
vim.keymap.set("i", "jj", "<ESC>", { silent = true, desc = "Exit the insert mode" })
-- Use which-key.add instead of vim.keymap.set, due to which-key: dynamic window mappings under leader-w (66bba78)
-- https://github.com/LazyVim/LazyVim/commit/66bba787b83afdd85b5ee95aa589fbe9fbb95535#diff-7cca712fe17a323d19a68b2ea48416807d822df291c4d811466e01bd398b0278
-- vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true, noremap = true, desc = "Save" })

vim.keymap.set("n", "<leader>cpp", ":CpPath<CR>", { desc = "Copy relative path" })
