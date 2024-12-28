return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"pyright",
					"ts_ls",
					"html",
					"cssls",
					"emmet_ls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspcf = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end
			lspcf.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspcf.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspcf.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspcf.ts_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspcf.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspcf.cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspcf.emmet_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}
