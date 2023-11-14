local function config()
	require("lualine").setup({
		options = {
			theme = require("ggfn/theme").name,
			icons_enabled = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = {},
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = config,
}
