local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end
-- Auto compile when there are changes in plugins.lua
-- This is not working
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        use {"neovim/nvim-lspconfig"}
        -- use {"glepnir/lspsaga.nvim"}
        use {"kabouzeid/nvim-lspinstall"}

        -- Telescope
        use {"nvim-lua/popup.nvim"}
        use {"nvim-lua/plenary.nvim"}
        use {"nvim-telescope/telescope.nvim"}
        use {"nvim-telescope/telescope-fzy-native.nvim"}

        -- Debugging
        -- TODO Decide on one debugger
        -- use {"mfussenegger/nvim-dap", opt = true, ft = {"python", "javascript"}}
        -- use {"puremourning/vimspector", opt = true, ft = {"python", "javascript"}}

        -- Testing TODO: configure mappings
        use 'alfredodeza/pytest.vim'

        -- Autocomplete
        use {"hrsh7th/nvim-compe", requires = {"hrsh7th/vim-vsnip"}}
        use {"rafamadriz/friendly-snippets"}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {"windwp/nvim-ts-autotag", opt = true, ft = {'html', 'vue', 'tsx'}}

        -- Explorer
        use {"kyazdani42/nvim-tree.lua"}

        -- GIT
        use {"lewis6991/gitsigns.nvim"}
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'junegunn/gv.vim'

        -- Interface
        use {"folke/which-key.nvim"}
        use '/mhinz/vim-startify'
        use {"windwp/nvim-autopairs", opt = true}
        use {"terrortylor/nvim-comment"}
        use {"kevinhwang91/nvim-bqf", opt = true}
        use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', ft = {'markdown'}}
        use 'voldikss/vim-floaterm'

        -- use {'verlag/wiki.vim'}

        -- TODO.TXT
        use {'freitass/todo.txt-vim', opt = true, ft = {'todo'}}
        use {'ccchapman/watson.nvim'}

        -- Color
        -- use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
        use {"joshdick/onedark.vim"}
        use {"tomasiser/vim-code-dark"}

        -- Icons
        use {"kyazdani42/nvim-web-devicons"}

        -- Status Line and Bufferline
        use {'wbthomason/lsp-status.nvim'}
        -- use {"glepnir/galaxyline.nvim"}
        use {"romgrk/barbar.nvim"}
    end
)
