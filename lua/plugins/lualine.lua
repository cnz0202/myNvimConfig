return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "onedark",
			},
			sections = {
				lualine_b = {'filename'},
				lualine_c = {
					{
						"navic",

						-- Component specific options
						color_correction = "static", -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
						-- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
						-- Setting it to "static" will perform a adjustment once when the component is being setup. This should
						--   be enough when the lualine section isn't changing colors based on the mode.
						-- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
						--   the current section.

						navic_opts = {
							highlight = true,
							separator = "  "
						}, -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
					},
				},
				lualine_x = { 'filetype' }
			},
		})
	end,
}
