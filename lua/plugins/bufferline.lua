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
		local palette = require("gruvbox").palette
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = palette.bright_blue })
		bufferline.setup({
			options = {
				numbers = function (opts)
					return string.format('[%s]', opts.id)
				end,
				show_buffer_icons = false,
				indicator = {
					style = "underline",
				},
				separator_style = { "", "" },
			},
		})
	end,
}
