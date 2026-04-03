return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local palette = require("gruvbox").palette
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {
					NormalFloat = { bg = palette.dark2 },
					Folded = { bg = palette.dark0 }
				},
				dim_inactive = false,
				transparent_mode = false,
			})
			vim.cmd.colorscheme("gruvbox")
			vim.api.nvim_set_hl(0, "FloatBorder", { link = "GruvboxFg1" })
		end,
		opts = ...,
	},
	-- {
	-- 	"cpea2506/one_monokai.nvim",
	-- 	config = function()
	-- 		require("one_monokai").setup({
	-- 			transparent = false,
	-- 			colors = {},
	-- 			themes = function(colors)
	-- 				return {
	-- 					normal = { bg = "#14161a" },
	-- 				}
	-- 			end,
	-- 			italics = true,
	-- 		})
	-- 	end,
	-- },
}
