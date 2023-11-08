local function config()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.black, -- python formatter
			null_ls.builtins.formatting.isort, -- python import sort
			null_ls.builtins.diagnostics.flake8, -- python linter
			null_ls.builtins.formatting.stylua, -- lua formatter
		},
	})
end

return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = config,
}
