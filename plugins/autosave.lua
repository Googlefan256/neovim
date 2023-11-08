local function config()
	require("auto-save").setup({
		trigger_events = { "InsertLeave", "BufLeave", "FocusLost" },
	})
end

return {
	"pocco81/auto-save.nvim",
	config = config,
}
