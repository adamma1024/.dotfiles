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
    end, {})
    vim.keymap.set("n", "<leader><leader>b", function()
      hop.hint_words({ direction = directions.BEFORE_CURSOR })
    end, {})
    vim.keymap.set("n", "<leader><leader>c", ":HopChar1<CR>", {})
    vim.keymap.set("n", "<leader><leader>s", ":HopChar2<CR>", {})
    -- Pattern Matching with t keyword
    vim.keymap.set("n", "<leader><leader>t", ":HopPattern<CR>", { noremap = true })
  end,
}
