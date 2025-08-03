return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					path_display = { "smart" },
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
			vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
			vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
			vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>")
			vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>")
			vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
			vim.keymap.set("n", "<leader>fm", ":Telescope marks<CR>")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
