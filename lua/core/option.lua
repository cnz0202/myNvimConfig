local opt = vim.opt

opt.nu = true
opt.rnu = true

opt.ts = 4
opt.sw = 4
opt.sts = 4
opt.ai = true

opt.cursorline = true
opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8

opt.signcolumn = "number"

opt.mousescroll = "ver:1"

opt.fillchars = "eob: "

vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

vim.api.nvim_create_user_command('Settings', function (input)
  vim.api.nvim_command(":e $MYVIMRC | cd %:p:h | Telescope find_files")
end, { nargs='*' })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.hl.on_yank({ higroup='Visual' }) end
})

