local function config()
	local theme = require("../theme").name
	vim.cmd("colorscheme " .. theme)
	require("../theme").config()
end

return {
	require("../theme").repo,
	dependencies = require("../theme").dependencies,
	lazy = false,
	priority = 1000,
	config = config,
}
