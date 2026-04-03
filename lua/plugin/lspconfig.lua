vim.pack.add({
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/stevearc/conform.nvim",
})

require("mason").setup()
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

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
vim.lsp.config("*", {
  capabilities = capabilities,
})

require("nvim-treesitter").install({
  "c",
  "cpp",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "python",
  "javascript",
  "rust",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    pcall(vim.treesitter.start)
  end,
  once = true,
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "stylua",
    "black",
    "prettier",
    "clang-format",
  },
})

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
      prepend_args = { "--tab-width=4", "--single-attribute-per-line" },
    },
  },
})
vim.keymap.set("n", "<leader>=", conform.format, {})
