local function config()
	local nls = require("null-ls")
	nls.setup({
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
					return utils.has_file({ ".prettierrc", ".prettierrc.js" })
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
