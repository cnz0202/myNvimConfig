return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		ensure_installed = {
			"stylua",
			"black",
			"prettier",
			"clang_format",
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },

					javascriptreact = { "prettier", stop_after_first = true },
					typescript = { "prettier", stop_after_first = true },
					typescriptreact = { "prettier", stop_after_first = true },
					html = { "prettier", stop_after_first = true },
					css = { "prettier", stop_after_first = true },
					json = { "prettier", stop_after_first = true },
					c = { "clang_format" },
				},
				formatters = {
					clang_format = {
						-- args = '--style="{BasedOnStyle: Google}"'
						args = '--style="{BasedOnStyle: llvm, UseTab: Always, IndentWidth: 4, TabWidth: 4}"',
					},
				},
			})
			vim.keymap.set("n", "<leader>=", conform.format, {})
		end,
	},
}
