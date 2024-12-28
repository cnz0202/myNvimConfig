vim.g.mapleader = " "

local km = vim.keymap

km.set("n", "<C-t>", "<cmd>tabnew<CR>")
km.set("n", "<leader>tq", "<cmd>tabclose<CR>")
km.set("n", "<tab>", "<cmd>tabn<CR>")
km.set("n", "<S-tab>", "<cmd>tabp<CR>")

km.set("n", "<leader>|", "<C-w>v")
km.set("n", "<leader>-", "<C-w>s")

km.set("n", "<leader>q", ":q<CR>")
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

km.set("n", "<leader>y", ":w !clip.exe<CR><CR>")
km.set("v", "<leader>y", ":'<,'>w !clip.exe<CR><CR>")

--vim.api.nvim_buf_set_option('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',{ noremap=true, silent=true })
