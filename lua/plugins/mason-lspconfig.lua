return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            },
        })
    end
}
