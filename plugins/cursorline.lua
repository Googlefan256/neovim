local function config()
	require("nvim-cursorline").setup({
		cursorline = {
			enable = true,
			timeout = 1000,
			number = false,
		},
		cursorword = {
			enable = true,
			min_length = 3,
			hl = { underline = true },
		},
	})
end

return {
	"yamatsum/nvim-cursorline",
	config = config,
}
