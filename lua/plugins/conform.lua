return {
	'stevearc/conform.nvim',
	opts = {},
	config = function ()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier", stop_after_first = true },
				javascriptreact = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true },
				html = { "prettier", stop_after_first = true },
				css = { "prettier", stop_after_first = true },
				json = { "prettier", stop_after_first = true },
				c = { "clang-format" }
			},
		})
		vim.keymap.set('n', conform.format())
	end
}
