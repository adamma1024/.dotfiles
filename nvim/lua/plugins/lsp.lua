return {
  {
    "neovim/nvim-lspconfig",
    opt = {
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
