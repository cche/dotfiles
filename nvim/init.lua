local cmd = vim.cmd
local fn = vim.fn
local g = vim.g


local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- opt("o", "shell", "fish")

-- All plugins are in ~/.config/nvim/lua/plugins.lua.
-- All individual plugin settings are in
-- ~/.config/nvim/lua/plugconf/$PLUGIN_NAME.
cmd('syntax on')
cmd('filetype plugin on')

require "plugins"

if fn.has("termguicolors") == 1 then
  vim.o.termguicolors = true
end
vim.o.t_Co = "256"

g["mapleader"] = " "
-- g["maplocalleader"] = "\\"

vim.o.ignorecase = true -- Ignore the case, unless...
vim.o.smartcase = true  -- ...there's caps in it.
vim.o.scrolloff = 5
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "↪"
vim.o.lazyredraw = true
vim.o.list = true
vim.o.fileencoding = "utf-8"
vim.o.pumheight = 10
vim.o.pumblend = 17
vim.o.conceallevel = 0
vim.wo.wrap = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cmdheight = 2
vim.o.synmaxcol = 800
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.cursorline = true
vim.o.guifont = "Fira Code Regular:h17"
vim.o.clipboard = "unnamedplus"
vim.o.hidden = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.title = true
if fn.has("mouse") == 1 then
  vim.o.mouse = "a"
end
vim.o.showcmd = true
vim.o.showmode = true
vim.o.updatetime = 1000
vim.wo.cursorline = true

-- opt("o", "background", "dark")
-- opt("o", "showmatch", true)

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noinsert,noselect"

vim.o.wildignore = "*.o,*~,*.pyc,*pycache*"

-- TODO Set spellfiles and shortcut to put words in them

-- tabs and indenting --

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.bo.smartindent = true

cmd([[hi! Comment gui=italic]])
-- Highlight merge conflicts
fn.matchadd("ErrorMsg", "^\\(<\\|=\\|>\\)\\{7\\}\\([^=].\\+\\)\\?$")

-- Avoid showing message extra message when using completion
-- Ensure autocmd works for Filetype
vim.o.shortmess = string.gsub(vim.o.shortmess, "F", "") .. "c"

-- The extra slash on the end saves files under the name of their full path
-- with the / character replaced with a %.
cmd("set undofile")
vim.o.undodir = fn.expand("~/.config/nvim/tmp/undo//")
if fn.isdirectory(vim.o.undodir) == 0 then fn.mkdir(vim.o.undodir, "p") end


vim.o.backup = false
vim.o.writebackup = false
vim.o.autowrite = true
vim.o.backupdir = fn.expand("~/.config/nvim/tmp/backup//")
if fn.isdirectory(vim.o.backupdir) == 0 then fn.mkdir(vim.o.backupdir, "p") end

vim.o.directory = fn.expand("~/.config/nvim/tmp/swap//")
vim.bo.swapfile = true
if fn.isdirectory(vim.o.directory) == 0 then fn.mkdir(vim.o.directory, "p") end


vim.o.timeoutlen = 500

-- Do not show stupid q: window
map("n", "q:", ":q")
map("n", "<c-l>", ":nohlsearch<cr><c-l>")

vim.wo.signcolumn = "yes"

--
-- Autogroups
--

cmd([[augroup autoformat]])
cmd([[autocmd!]])
cmd([[autocmd BufWritePre *.py,*.lua.*,*.json lua vim.lsp.buf.formatting_sync(nil, 1000)]])
cmd([[autocmd BufWritePre *.html,*.vue,*.js,*.ts,*.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)]])
cmd([[augroup END]])

cmd([[augroup markdown]])
cmd([[autocmd!]])
cmd([[autocmd Filetype markdown setlocal wrap]])
cmd([[autocmd Filetype markdown setlocal spell spelllang=en,fr,es]])
cmd([[augroup END]])

cmd([[augroup Goyo]])
cmd([[autocmd!]])
cmd([[autocmd User GoyoEnter lua require('gitsigns').toggle_signs()]])
cmd([[autocmd User GoyoLeave lua require('gitsigns').toggle_signs()]])
cmd([[autocmd User GoyoEnter set laststatus=0]])
cmd([[autocmd User GoyoLeave set laststatus=2]])
cmd([[augroup END]])

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache') -- TODO not used


-------
require('defaults')
require('settings')
require('keymappings')
require('plugconf.nvimtree') -- This plugin must be required before colorscheme.  Placing it after will break navigation keymappings
require('colorscheme') -- This plugin must be required somewhere after nvimtree. Placing it before will break navigation keymappings
require('plugconf.galaxyline')
require('nvim_comment').setup()
require('plugconf.compe')
require('plugconf.barbar')
require('plugconf.telescope')
require('plugconf.gitsigns')
require('plugconf.treesitter')
require('plugconf.floaterm')
require('plugconf.watson')

--require('lv-autopairs')
require('plugconf.which-key')

-- LSP
require('lsp')

vim.cmd('source ~/.config/nvim/vimscript/startify.vim')
vim.cmd('source ~/.config/nvim/vimscript/todo-txt.vim')
