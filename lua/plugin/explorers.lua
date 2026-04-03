vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  { src = "https://github.com/nvim-telescope/telescope.nvim", version = "master" },
  "https://github.com/mikavilpas/yazi.nvim",
})

require("oil").setup({
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
  },
  float = {
    padding = 6,
  },
})
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

require("telescope").setup({
  defaults = {
    path_display = { "smart" },
  },
})
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fm", ":Telescope marks<CR>")

vim.g.loaded_netrwPlugin = 1
require("yazi").setup({
  open_for_directories = false,
  keymaps = {
    show_help = "<f1>",
  },
})
vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
