return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
	config = function()
		local bufferline = require("bufferline")
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#83a598" })
		bufferline.setup({
			options = {
				indicator = {
					style = "underline",
				},
				separator_style = { "", "" },
			},
		})
	end,
}
