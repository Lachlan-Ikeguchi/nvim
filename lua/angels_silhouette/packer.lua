-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    ---- Functionality ----
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Clipboard
    use 'theprimeagen/harpoon'
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            { 'kkharji/sqlite.lua', module = 'sqlite' },
        },
    }

    -- Comment
    use 'terrortylor/nvim-comment'

    -- File system
    use {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup {
                default_file_explorer = true,
                delete_to_trash = true,
                skip_confirm_for_simple_edits = true,
                prompt_save_on_select_new_entry = true,
                lsp_file_methods = {
                    autosave_changes = true,
                },
                watch_for_changes = true,
                view_options = {
                    show_hidden = true,
                },
                git = {
                    add = function(path)
                        return true
                    end,
                    mv = function(src_path, dest_path)
                        return true
                    end,
                    rm = function(path)
                        return true
                    end,
                },
            }
        end,
    }

    -- Git
    use 'tpope/vim-fugitive'
    use {
        'akinsho/git-conflict.nvim',
        tag = "*",
    }
    use 'lewis6991/gitsigns.nvim'

    -- Auto pair
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    -- Fuzzy find
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            use 'hrsh7th/cmp-buffer',
            use 'hrsh7th/cmp-calc',
            use 'hrsh7th/cmp-path',
            use 'hrsh7th/cmp-nvim-lua',
            use 'hrsh7th/cmp-nvim-lsp',
            use 'hrsh7th/cmp-cmdline',
            use 'saadparwaiz1/cmp_luasnip',
            use {
                "L3MON4D3/LuaSnip",
                run = "make install_jsregexp",
                requires = "rafamadriz/friendly-snippets"
            },
        }
    })
    use 'williamboman/mason-lspconfig.nvim'
    use 'williamboman/mason.nvim'



    ---- Aethetics ----
    use "lukas-reineke/indent-blankline.nvim"
    use 'nvim-treesitter/nvim-treesitter'
    use 'HiPhish/rainbow-delimiters.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Themes
    use 'iruzo/matrix-nvim'
    use "catppuccin/nvim"
end)
