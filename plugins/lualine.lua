local function config()
	require("lualine").setup({
		options = { theme = "everforest" },
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = config,
}
