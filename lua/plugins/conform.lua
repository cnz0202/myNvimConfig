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
				-- log_level = vim.log.levels.TRACE,
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
					c = { "clang_format" },
				},
				formatters = {
					clang_format = {
						-- args = '--style="{BasedOnStyle: Google}"'
						args = '--style="{BasedOnStyle: llvm, UseTab: Always, IndentWidth: 4, TabWidth: 4}"',
					},
					prettier = {
						prepend_args = { '--tab-width=4', '--single-attribute-per-line' },
					},
				},
			})
			vim.keymap.set("n", "<leader>=", conform.format, {})

			local mp = {
				["javascript"]		= "setlocal et ts=4 sw=4 sts=4",
				["typescript"]		= "setlocal et ts=4 sw=4 sts=4",
				["javascriptreact"]	= "setlocal et ts=4 sw=4 sts=4",
				["typescriptreact"]	= "setlocal et ts=4 sw=4 sts=4",
				["json"]			= "setlocal et ts=2 sw=2 sts=2",
				["python"]			= "setlocal et ts=4 sw=4 sts=4",
			}
			vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
				callback = function(opts)
					if mp[vim.bo.filetype] then
						vim.cmd(mp[vim.bo.filetype])
					end
				end,
			})
		end,
	},
}
