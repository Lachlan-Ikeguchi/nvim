return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        "rafamadriz/friendly-snippets",
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
        },
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp = require('cmp')
        cmp.setup({
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'calc' },
                { name = 'path' },
                { name = 'nvim_lua' },
                { name = 'luasnip', option = { show_autosnippets = true, use_show_condition = true } }
            },
            snippet = {
                expand = function(args)
                    require 'luasnip'.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })
    end
}
