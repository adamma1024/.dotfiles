-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- spaces and tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- enable line numbers
vim.cmd("set number")

-- Function to detect if the current OS is Windows
function is_windows()
  local os_name = os.getenv("OS")
  return os_name and os_name:match("Windows")
end

-- Use pwsh in Windows
if is_windows() then
  -- Check if 'pwsh' is executable and set the shell accordingly
  if vim.fn.executable("pwsh") == 1 then
    vim.o.shell = "pwsh"
  else
    vim.o.shell = "powershell"
  end
end

-- Setting shell command flags
vim.o.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"

-- Setting shell redirection
vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'

-- Setting shell pipe
vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'

-- Setting shell quote options
vim.o.shellquote = ""
vim.o.shellxquote = ""
