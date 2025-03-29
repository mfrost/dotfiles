-- Leader key
vim.g.mapleader = ','

require("config.lazy")

-- Editor settings
vim.opt.wrap = false
vim.opt.ruler = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 3
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.listchars = {
  tab = '→ ',
  space = '·',
  nbsp = '␣',
  trail = '•',
  eol = '¶',
  precedes = '«',
  extends = '»'
}
vim.opt.list = false
vim.opt.backup = false
vim.opt.backupcopy = 'yes'

-- Use treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- FileType specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function() vim.opt_local.expandtab = false end
})

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-t>', ':tabnew<CR>', opts)
map('n', '<Right>', 'gt', opts)
map('n', '<Left>', 'gT', opts)
map('n', '<F6>', ':set list! list?<CR>', {})
map('n', '<F7>', 'gg=G<C-o><C-o>', {})
