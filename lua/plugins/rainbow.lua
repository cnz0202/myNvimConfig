return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = {
		"hiphish/rainbow-delimiters.nvim",
	},
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
	config = function()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}
		local rainbow_delimiters = require("rainbow-delimiters")
		local hooks = require("ibl.hooks")
		local palette = require("gruvbox").palette
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = palette.bright_red })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = palette.bright_yellow })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = palette.bright_blue })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = palette.bright_orange })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = palette.bright_green })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = palette.bright_purple })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = palette.bright_aqua })
		end)

		---@type rainbow_delimiters.config
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			priority = {
				[""] = 110,
				lua = 210,
			},
			highlight = highlight,
		}
		require("ibl").setup({ scope = { highlight = highlight } })
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
