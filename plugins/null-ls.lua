local function config()
  local nls = require("null-ls")
  nls.setup({
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    end,
    diagnostics_format = "#{m} (#{s}: #{c})",
    sources = {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.gofmt,
      nls.builtins.formatting.rustfmt,
      nls.builtins.formatting.black,
      nls.builtins.formatting.deno_fmt.with({
        condition = function(utils)
          return utils.has_file({ "deno.json", "deno.jsonc" })
        end,
      }),
      nls.builtins.formatting.prettier.with({
        condition = function(utils)
          return utils.has_file({ "node_modules/.bin/prettier" })
        end,
        prefer_local = "node_modules/.bin",
      }),
      nls.builtins.formatting.shfmt,
      nls.builtins.formatting.biome.with({
        condition = function(utils)
          return utils.has_file({ "biome.json" })
        end,
      }),
    },
  })
end

return {
  "nvimtools/none-ls.nvim",
  config = config,
}
