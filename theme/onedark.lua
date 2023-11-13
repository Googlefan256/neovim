return {
	name = "onedark",
	repo = "navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			style = "dark",
		})
	end,
}
