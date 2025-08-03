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
		bufferline.setup({
			options = {
				indicator = {
					style = "underline",
				},
				separator_style = { "", "" },
			},
			highlights = {
				indicator_selected = {
					sp = "#83a598",
				},
				buffer_selected = {
					sp = "#83a598",
				},
				close_button_selected = {
					sp = "#83a598",
				},
				modified_selected = {
					sp = "#83a598",
				},
			},
		})
	end,
}
