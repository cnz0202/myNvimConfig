vim.pack.add({
  "https://github.com/lervag/vimtex",
  "https://github.com/kdheepak/lazygit.nvim",
  "https://github.com/kevinhwang91/nvim-bqf",
})

vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_view_sioyek_exe = "/usr/local/bin/sioyek"
vim.g.vimtex_callback_progpath = "wsl nvim"
vim.g.vimtex_compiler_latexmk_engines = {
  ['_'] = '-xelatex',
}
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  pattern = "*.tex",
  callback = function(opts)
    vim.b.vimtex_main = vim.fn.expand("%:p")
  end,
})

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- temporary fix for :diffget not working in nvimdiff
-- https://github.com/neovim/neovim/issues/22696
if vim.opt.diff:get() then
  vim.opt.diffopt:remove("linematch:40")
end
