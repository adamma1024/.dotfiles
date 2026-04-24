return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              pythonPath = "/usr/local/bin/python3.12",
            },
          },
        },
      },
    },
  },
}
