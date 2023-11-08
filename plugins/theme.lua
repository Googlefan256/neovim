local function config()
	require("everforest").setup({
    background = 'hard'
  })
  vim.cmd([[colorscheme everforest]])
end

return {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000,
	config = config,
}
