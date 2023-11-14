local function config()
	local theme = require("ggfn/theme").name
	vim.cmd("colorscheme " .. theme)
	require("ggfn/theme").config()
end

return {
	require("ggfn/theme").repo,
	dependencies = require("ggfn/theme").dependencies,
	lazy = false,
	priority = 1000,
	config = config,
}
