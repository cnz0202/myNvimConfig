vim.g.mapleader = " "

local map = vim.keymap.set

-- map.set("n", "<tab>", "<cmd>bnext<CR>")
-- map.set("n", "<S-tab>", "<cmd>bprev<CR>")

-- map.set("n", "<leader>|", "<C-w>v")
-- map.set("n", "<leader>-", "<C-w>s")

map("n", "<leader>q", ":bd!<CR>")
map("n", "<leader>w", ":w<CR>")
-- map("n", "<C-s>", ":w<CR>")
-- map("i", "<C-s>", "<ESC>:w<CR>")
map("n", "<leader>x", ":qa<CR>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- map("n", "<leader>ss", [[:set hls<CR>*]])
-- map("n", "<leader>se", [[:set nohls<CR>]])
-- map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>y", ":w !/mnt/c/Windows/System32/clip.exe<CR><CR>")
map("v", "<leader>y", ":'<,'>w !/mnt/c/Windows/System32/clip.exe<CR><CR>")

map("t", "<leader><ESC>", "<C-\\><C-n>")

map("n", "*", ":set hls<CR>*")
map("n", "<leader>*", ":nohls<CR>")

-- map("n", "]q", ":cnext<CR>")
-- map("n", "[q", ":cprev<CR>")
-- map("n", "<S-d>", "<C-w>d")

vim.cmd([[ au FileType help :wincmd L ]])
vim.cmd([[ au TermOpen * setlocal nonu nornu ]])

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function (ev)
    map("n", "gD", vim.lsp.buf.definition);
  end
})
