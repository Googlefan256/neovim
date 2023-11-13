local function config()
	local theme = require("../theme").name
	require(theme).setup({
		background = "hard",
	})
	vim.cmd("colorscheme " .. theme)
end

return {
	require("../theme").repo,
	lazy = false,
	priority = 1000,
	config = config,
}
