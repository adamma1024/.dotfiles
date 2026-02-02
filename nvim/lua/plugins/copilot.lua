return {
  {
    "nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        sources = {
          -- Copilot Source
          { name = "copilot", group_index = 2 },
          -- Other Sources
          { name = "nvim_lsp", group_index = 2 },
          { name = "path", group_index = 2 },
          { name = "luasnip", group_index = 2 },
        },
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          LazyVim.lsp.on_attach(function(client)
            if client.name == "copilot" then
              copilot_cmp._on_insert_enter({})
            end
          end)
        end,
      },
      { "onsails/lspkind.nvim" },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opt = {
      suggestion = { enable = false },
      panel = { enable = false },
      filetypes = {
        cpp = false,
        lua = true,
        javascript = false,
        typescript = false,
        javascriptreact = false,
        typescriptreact = false,
        python = true,
      },
    },
  },
}
