return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "python", "javascript", "rust" },
			auto_install = true,

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>v",
					node_incremental = "v",
					scope_incremental = false,
					node_decremental = "V",
				},
			},
		})
	end,
}
