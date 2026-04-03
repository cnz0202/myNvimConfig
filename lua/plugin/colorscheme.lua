vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/goolord/alpha-nvim",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  "https://github.com/hiphish/rainbow-delimiters.nvim",
})

local palette = require("gruvbox").palette
require("gruvbox").setup({
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {
    NormalFloat = { bg = palette.dark2 },
    Folded = { bg = palette.dark0_soft },
  },
})
vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_hl(0, "FloatBorder", { link = "GruvboxFg1" })

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
  "                                                     ",
  "                                                     ",
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

dashboard.section.header.opts.hl = "GruvboxGreen"
-- Set menu

local function button_hl(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "GruvboxBlue"
  b.opts.hl_shortcut = "GruvboxOrange"
  return b
end
dashboard.section.buttons.val = {
  button_hl("i", "  > New file", ":ene <BAR> startinsert <CR>"),
  button_hl("f", "󰍉  > Find file", ":Telescope find_files<CR>"),
  button_hl("o", "  > Recent", ":Telescope oldfiles<CR>"),
  button_hl("s", "  > Settings", ":e $MYVIMRC | cd %:p:h | Telescope find_files <CR>"),
  button_hl("q", "󰅙  > Quit NVIM", ":qa<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()
dashboard.section.footer.opts.hl = "Comment"

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])

local bufferline = require("bufferline")
vim.api.nvim_set_hl(0, "TabLineSel", { bg = palette.bright_blue })
bufferline.setup({
  options = {
    numbers = function(opts)
      return string.format("[%s]", opts.id)
    end,
    show_buffer_icons = false,
    indicator = {
      style = "underline",
    },
    separator_style = { "", "" },
  },
})

require("lualine").setup({
  options = {
    theme = "onedark",
  },
})
vim.api.nvim_set_hl(0, "StatusLine", { reverse = false })
vim.api.nvim_set_hl(0, "StatusLineNC", { reverse = false })

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local rainbow_delimiters = require("rainbow-delimiters")
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = palette.bright_red })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = palette.bright_yellow })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = palette.bright_blue })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = palette.bright_orange })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = palette.bright_green })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = palette.bright_purple })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = palette.bright_aqua })
end)

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
  strategy = {
    [""] = rainbow_delimiters.strategy["global"],
    vim = rainbow_delimiters.strategy["local"],
  },
  query = {
    [""] = "rainbow-delimiters",
    lua = "rainbow-blocks",
  },
  priority = {
    [""] = 110,
    lua = 210,
  },
  highlight = highlight,
}
require("ibl").setup({ scope = { highlight = highlight } })
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
