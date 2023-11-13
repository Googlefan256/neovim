local function config()
	local ts = require("nvim-treesitter.configs")
	ts.setup({
		highlight = {
			enable = true,
			disable = {},
		},
		indent = {
			enable = true,
			disable = {},
		},
		ensure_installed = {
			"tsx",
			"toml",
			"fish",
			"php",
			"json",
			"yaml",
			"css",
			"html",
			"lua",
			"rust",
			"sql",
			"typescript",
		},
		autotag = {
			enable = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = config,
}
