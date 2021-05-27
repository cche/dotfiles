local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

local function opt(scope, key, value)
  local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

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

g["mapleader"] = " "
-- g["maplocalleader"] = "\\"

opt("o", "ignorecase", true) -- Ignore the case, unless...
opt("o", "smartcase", true)  -- ...there's caps in it.

--  displaying text --

opt("o", "scrolloff", 3)
opt("o", "linebreak", true)
opt("o", "breakindent", true)
opt("o", "showbreak", "↪")
opt("o", "lazyredraw", true)
opt("o", "list", true)
opt("w", "wrap", true)
opt("o", "fileencoding", "utf-8")
opt("o", "pumheight", 10)
opt("o", "conceallevel", 0)
opt("w", "number", true)
opt("w", "relativenumber", true)
vim.o.cmdheight = 2

-- syntax, highlighting and spelling ---

-- opt("o", "background", "dark")

if fn.has("termguicolors") == 1 then
  opt("o", "termguicolors", true)
end
opt("o", "t_Co", "256")

opt("o", "synmaxcol", 800)
opt("o", "hlsearch", true)
opt("o", "cursorline", true)
opt("o", "guifont", "SauceCodePro Nerd Font:h17")
opt("o", "clipboard", "unnamedplus")
-- TODO Set spellfiles and shortcut to put words in them


cmd([[hi! Comment gui=italic]])

-- Highlight VCS conflict markers
fn.matchadd("ErrorMsg", "^\\(<\\|=\\|>\\)\\{7\\}\\([^=].\\+\\)\\?$")

opt("o", "hidden", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)

opt("o", "title", true)

if fn.has("mouse") == 1 then
  opt("o", "mouse", "a")
end

opt("o", "showcmd", true)
opt("o", "showmode", true)

-- Avoid showing message extra message when using completion
-- Ensure autocmd works for Filetype
vim.o.shortmess = string.gsub(vim.o.shortmess, "F", "") .. "c"

-- Undo, backup and swap files ---
cmd("set undofile")
-- The extra slash on the end saves files under the name of their full path
-- with the / character replaced with a %.
opt("o", "undodir", fn.expand("~/.config/nvim/tmp/undo//"))
-- Make the undo directory automatically if it doesn't already exist.
if fn.isdirectory(vim.o.undodir) == 0 then fn.mkdir(vim.o.undodir, "p") end

-- Set completeopt to have a better completion experience
opt("o", "completeopt", "menuone,noinsert,noselect")


opt("o", "backup", false)
opt("o", "writebackup", false)
opt("o", "autowrite", true)
opt("o", "backupdir", fn.expand("~/.config/nvim/tmp/backup//"))

-- Make the backup directory automatically if it doesn't already exist.
if fn.isdirectory(vim.o.backupdir) == 0 then fn.mkdir(vim.o.backupdir, "p") end

-- }}}
-- 19 the swap file ------------------------------------------------ {{{

opt("o", "directory", fn.expand("~/.config/nvim/tmp/swap//"))
-- As of this writing (2021-02-13) for reasons unknown vim.o.noswapfile
-- isn't a thing in Lua + Neovim so we can't set it.
cmd("set noswapfile")

-- Make the swap directory automatically if it doesn't already exist.
if fn.isdirectory(vim.o.directory) == 0 then fn.mkdir(vim.o.directory, "p") end

-- tabs and indenting --

opt("o", "tabstop", 4)
opt("o", "shiftwidth", 4)
opt("o", "softtabstop", 4)
opt("o", "expandtab", true)
opt("b", "smartindent", true)


opt("o", "timeoutlen", 500)

-- Do not show stupid q: window
map("", "q:", ":q")
map("n", "<c-l>", ":nohlsearch<cr><c-l>")

opt("w", "signcolumn", "yes")

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
-- require('lsp.lua-ls')
-- require('lsp.bash-ls')
-- require('lsp.go-ls')
-- require('lsp.js-ts-ls')
-- require('lsp.python-ls')
-- require('lsp.rust-ls')
-- require('lsp.json-ls')
-- require('lsp.yaml-ls')
-- require('lsp.vim-ls')
-- require('lsp.graphql-ls')
-- require('lsp.docker-ls')
-- require('lsp.html-ls')
-- require('lsp.css-ls')
-- require('lsp.emmet-ls')
-- require('lsp.efm-general-ls')
-- require('lsp.latex-ls')
-- require('lsp.ruby-ls')
-- require('lsp.vue-ls')
-- require('lsp.angular-ls')

vim.cmd('source ~/.config/nvim/vimscript/startify.vim')
vim.cmd('source ~/.config/nvim/vimscript/todo-txt.vim')
