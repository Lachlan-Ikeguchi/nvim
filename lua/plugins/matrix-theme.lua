function apply_matrix_theme()
    vim.cmd [[colorscheme matrix]]

    require("rainbow-delimiters").disable()

    local highlight = {
        "DarkGreen",
        "Green",
        "LightGreen",
    }

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "DarkGreen", { fg = "#006400" })
        vim.api.nvim_set_hl(0, "Green", { fg = "#209020" })
        vim.api.nvim_set_hl(0, "LightGreen", { fg = "#64FF64" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
end

return { 'lachlan-ikeguchi/nvim-matrix-theme', branch = 'feat/expanded_palette' }
