return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- require('nvim-treesitter').setup {}
		require('nvim-treesitter').install({
			"c",
			"cpp",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"python",
			"javascript",
			"rust",
		})
		vim.api.nvim_create_autocmd({ "BufReadPost" }, {
			pattern = "*",
			callback = function()
				print("BufReadPost")
				vim.treesitter.start()
			end,
			once = true,
		})
	end,
}
