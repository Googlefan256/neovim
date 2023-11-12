local function config()
	vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
	require("telescope").load_extension("file_browser")
	vim.api.nvim_set_keymap("n", "<space>ff", ":Telescope file_browser<CR>", { noremap = true })
	require("telescope").setup({
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			},
		},
	})
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>p", builtin.find_files, {})
	-- vim.keymap.set("n", "<leader>f", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.0",
	config = config,
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-lua/plenary.nvim",
	},
}
