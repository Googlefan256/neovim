return {
	name = "everforest",
	repo = "neanias/everforest-nvim",
	config = function()
		require("everforest").setup({
			background = "hard",
		})
	end,
}
