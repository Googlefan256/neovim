local function config()
  require("lspsaga").setup()

  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
  vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
  vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
  vim.keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
  vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end,
  })
end

return {
  "glepnir/lspsaga.nvim",
  config = config,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
