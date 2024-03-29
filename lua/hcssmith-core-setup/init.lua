local M = {}

---@class AutoCmdEvent
---@field buf number
---@field event string
---@field file string
---@field group number
---@field id number
---@field match string


function M.setup(opts)
  opts = opts or {}

  local default = {
    Theme = 'tokyonight',
    TabWidth = 2,
    TextWidth = 80,
    Home = '/home/hcssmith',
    WrapFiles = { '*.norg', '*.md', '*.tex', '*.nw' }
  }

  local group = vim.api.nvim_create_augroup('HcssmithCoreSetup', {})


  default.__index = default

  setmetatable(opts, default)

  vim.api.nvim_create_autocmd('BufEnter', {
    desc = 'Setup Lsp keybindings on buffer when LSP is attached',
    group = group,
    pattern = opts.WrapFiles,
    ---@param ev AutoCmdEvent
    callback = function(ev)
      vim.bo[ev.buf].textwidth = opts.TextWidth
      vim.bo[ev.buf].wrapmargin = opts.TextWidth
      vim.cmd.setlocal('wrap')
    end
  })

  vim.api.nvim_create_autocmd("BufEnter", {
    desc = 'Set correct filetype on non standard files',
    group = group,
    pattern = { '*.nw' },
    ---@param ev AutoCmdEvent
    callback = function(ev)
      vim.bo[ev.buf].filetype = "tex"
    end
  })

  vim.o.termguicolors = true
  vim.cmd.colorscheme(opts.Theme)

  vim.opt.nu = true
  vim.opt.relativenumber = true

  vim.opt.tabstop = opts.TabWidth
  vim.opt.softtabstop = opts.TabWidth
  vim.opt.shiftwidth = opts.TabWidth
  vim.opt.expandtab = true

  vim.opt.smartindent = true

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
