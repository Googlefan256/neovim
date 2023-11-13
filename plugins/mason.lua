local function config()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
	require("mason-lspconfig").setup({
		ensure_installed = {
			"pyright",
			"eslint",
			"tsserver",
			"lua_ls",
			"gopls",
			"html",
			"cssls",
			"tailwindcss",
			"denols",
			"biome",
		},
	})
	require("mason-lspconfig").setup_handlers({
		function(server)
			local nvim_lsp = require("lspconfig")
			local opt = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(
					vim.lsp.protocol.make_client_capabilities()
				),
			}
			if server == "tsserver" then
				opt.root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
			elseif server == "eslint-lsp" then
				opt.root_dir = nvim_lsp.util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc")
			elseif server == "denols" then
				opt.root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json")
				opt.init_options = {
					lint = true,
					unstable = true,
					suggest = {
						imports = {
							hosts = {
								["https://deno.land"] = true,
								["https://cdn.nest.land"] = true,
								["https://crux.land"] = true,
							},
						},
					},
				}
			end
			nvim_lsp[server].setup(opt)
		end,
	})
	require("lspconfig.ui.windows").default_options.border = "single"
end

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = config,
}
