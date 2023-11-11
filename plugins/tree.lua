local function config()
	local function my_on_attach(bufnr)
		local api = require("nvim-tree.api")
		local function opts(desc)
			return {
				desc = "nvim-tree: " .. desc,
				buffer = bufnr,
				noremap = true,
				silent = true,
				nowait = true,
			}
		end
		api.config.mappings.default_on_attach(bufnr)
		vim.keymap.set("u", api.tree.change_root_to_parent, opts("Up"))
	end
	require("nvim-tree").setup({
		sort_by = "case_sensitive",
		view = {
			adaptive_size = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
			git_ignored = false,
		},
		on_attach = tree_on_attach,
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
