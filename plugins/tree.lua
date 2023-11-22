local function config()
	require("nvim-tree").setup({
		sort_by = "case_sensitive",
		view = {
			adaptive_size = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
			git_ignored = false,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
	})
	-- start neovim with open nvim-tree
	require("nvim-tree.api").tree.toggle(false, true)
end

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = config,
	lazy = true,
	event = "VimEnter",
}
