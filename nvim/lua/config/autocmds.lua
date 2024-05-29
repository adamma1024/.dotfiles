-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- ############################## template of code #############################
-- cpp template
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "cpp",
  command = "0r ~/.vim/template/cpp_temp.cpp",
})
