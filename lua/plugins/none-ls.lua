return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.black,
      },
    })
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end)
  end
}
