local function config()
	require("colorizer").setup({}, {
		RRGGBBAA = true,
		rgb_fn = true,
		hsl_fn = true,
	})
end

return {
	"norcalli/nvim-colorizer.lua",
	config = config,
}
