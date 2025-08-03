vim.g.mapleader = " "

local km = vim.keymap

km.set("n", "<tab>", "<cmd>bnext<CR>")
km.set("n", "<S-tab>", "<cmd>bprev<CR>")

km.set("n", "<leader>|", "<C-w>v")
km.set("n", "<leader>-", "<C-w>s")

km.set("n", "<leader>q", ":bd!<CR>")
km.set("n", "<leader>w", ":w<CR>")
km.set("n", "<C-s>", ":w<CR>")
km.set("i", "<C-s>", "<ESC>:w<CR>")
km.set("n", "<leader>x", ":qa<CR>")

km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")

-- km.set("n", "<leader>ss", [[:set hls<CR>*]])
-- km.set("n", "<leader>se", [[:set nohls<CR>]])
-- km.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")

km.set("n", "<leader>y", ":w !/mnt/c/Windows/System32/clip.exe<CR><CR>")
km.set("v", "<leader>y", ":'<,'>w !/mnt/c/Windows/System32/clip.exe<CR><CR>")

km.set("t", "<leader><ESC>", "<C-\\><C-n>")

km.set("n", "*", ":set hls<CR>*")
km.set("n", "<leader>*", ":nohls<CR>")

km.set("n", "]q", ":cnext<CR>")
km.set("n", "[q", ":cprev<CR>")
km.set("n", "<S-d>", "<C-w>d")

vim.cmd([[ au FileType help :wincmd L ]])
vim.cmd([[ au TermOpen * setlocal nonu nornu ]])

