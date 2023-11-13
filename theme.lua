local tokyo = require("./theme/tokyo")
local onedark = require("./theme/onedark")
local dracula = require("./theme/dracula")
local apprentice = require("./theme/apprentice")
local everforest = require("./theme/everforest")
local papercolor = require("./theme/papercolor")
local solarized = require("./theme/solarized")
local deps = {
	tokyo.repo,
	apprentice.repo,
	everforest.repo,
	papercolor.repo,
	solarized.repo,
	dracula.repo,
	onedark.repo,
}

local current = papercolor

return {
	dependencies = deps,
	name = current.name,
	repo = current.repo,
	config = current.config or function() end,
}
