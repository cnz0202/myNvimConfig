vim.pack.add({
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/numToStr/Comment.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/kylechui/nvim-surround",
  "https://github.com/Wansmer/treesj",
  "https://github.com/aaronik/treewalker.nvim",
  "https://github.com/kevinhwang91/promise-async",
  "https://github.com/kevinhwang91/nvim-ufo",
})

local map = vim.keymap.set

require("nvim-autopairs").setup({})

local flash = require("flash")
map({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
map({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter" })
map({ "o" }, "r", flash.remote, { desc = "Remote Flash" })
map({ "o", "x" }, "R", flash.treesitter_search, { desc = "Treesitter Search" })
map({ "c" }, "<c-s>", flash.toggle, { desc = "Toggle Flash Search" })

require("nvim-surround").setup({})

require("treesj").setup({})

require("treewalker").setup({
  highlight = true,
  highlight_duration = 250,
  highlight_group = "CursorLine",
  select = false,
  jumplist = true,
})
-- movement
map({ "n" }, "[n", "<cmd>Treewalker Up<cr>", { silent = true })
map({ "n" }, "]n", "<cmd>Treewalker Down<cr>", { silent = true })
map({ "n" }, "[N", "<cmd>Treewalker Left<cr>", { silent = true })
map({ "n" }, "]N", "<cmd>Treewalker Right<cr>", { silent = true })

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
require("ufo").setup({})
map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)
