return {
  "smoka7/hop.nvim",
  version = "*",
  opts = {
    keys = "etovxqpdygfblzhckisuran",
  },
  config = function()
    -- place this in one of your configuration file(s)
    local hop = require("hop")
    hop.setup()
    local directions = require("hop.hint").HintDirection
    vim.keymap.set("n", "<leader><leader>w", function()
      hop.hint_words({ direction = directions.AFTER_CURSOR })
    end, { desc = "Go to next words" })
    vim.keymap.set("n", "<leader><leader>b", function()
      hop.hint_words({ direction = directions.BEFORE_CURSOR })
    end, { desc = "Back to previous words" })
    vim.keymap.set("n", "<leader><leader>c", ":HopChar1<CR>", { desc = "Hop with one character" })
    vim.keymap.set("n", "<leader><leader>s", ":HopChar2<CR>", { desc = "Hop 2 chars" })
    -- Pattern Matching with t keyword
    vim.keymap.set("n", "<leader><leader>t", ":HopPattern<CR>", { noremap = true, desc = "Hop's pattern searching" })
  end,
}
