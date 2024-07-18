return {
  "folke/which-key.nvim",
  config = function(_, opts)
    local wk = require("which-key")
    wk.add({
      { "<leader>w", ":w<CR>", desc = "Save", mode = "n", noremap = true },
    })
  end,
}
