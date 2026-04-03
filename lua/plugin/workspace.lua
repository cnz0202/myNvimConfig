vim.pack.add({
  "https://github.com/lervag/vimtex",
	"https://github.com/kdheepak/lazygit.nvim",
})

vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_view_sioyek_exe = "/usr/local/bin/sioyek"
vim.g.vimtex_callback_progpath = "wsl nvim"
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  pattern = "*.tex",
  callback = function(opts)
    vim.b.vimtex_main = vim.fn.expand("%:p")
  end,
})

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
