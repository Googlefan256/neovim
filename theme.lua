local tokyo = require("ggfn/theme/tokyo")
local onedark = require("ggfn/theme/onedark")
local dracula = require("ggfn/theme/dracula")
local apprentice = require("ggfn/theme/apprentice")
local everforest = require("ggfn/theme/everforest")
local papercolor = require("ggfn/theme/papercolor")
local solarized = require("ggfn/theme/solarized")
local deps = {
  tokyo.repo,
  apprentice.repo,
  everforest.repo,
  papercolor.repo,
  solarized.repo,
  dracula.repo,
  onedark.repo,
}

local current = dracula

return {
  dependencies = deps,
  name = current.name,
  repo = current.repo,
  config = current.config or function() end,
}
