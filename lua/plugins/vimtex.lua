return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "sioyek"
		vim.g.vimtex_view_sioyek_exe = "/usr/bin/sioyek"
		vim.g.vimtex_callback_progpath = "wsl nvim"

		vim.api.nvim_create_autocmd({ "BufReadPre" }, {
			pattern = "*.tex",
			callback = function(opts)
				vim.b.vimtex_main = vim.fn.expand("%:p")
			end,
		})
	end,
}
