local M = {}

function M.setup(opts)
  opts = opts or {}

  local default = {
    Theme = 'tokyonight',
    TabWidth = 2,
    TextWidth = 80,
    Home = '/home/hcssmith',
  }

  default.__index = default

  setmetatable(opts, default)


  vim.o.termguicolors = true
  vim.cmd.colorscheme(opts.Theme)

  vim.opt.nu = true
  vim.opt.relativenumber = true

  vim.opt.tabstop = opts.TabWidth
  vim.opt.softtabstop = opts.TabWidth
  vim.opt.shiftwidth = opts.TabWidth
  vim.opt.expandtab = true

  vim.opt.smartindent = true

  vim.opt.wrap = true
  vim.opt.textwidth = opts.TextWidth

  vim.opt.hlsearch = false
  vim.opt.incsearch = true

  vim.cmd.set("splitbelow")
  vim.cmd.set("splitright")

  vim.opt.swapfile = false
  vim.opt.backupdir = opts.Home .. "/.vim/backupdir"
  vim.opt.undodir = opts.Home .. "/.vim/undodir"
  vim.opt.undofile = true


  vim.opt.scrolloff = 4
  vim.opt.signcolumn = "yes"
  vim.opt.isfname:append("@-@")
end

return M
