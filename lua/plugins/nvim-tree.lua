return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				width = 30,
			},
			tab = { sync = {
				open = true,
				close = true,
			}},
			--auto_close = true,
		})
		vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")
		vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>")
	end
}
