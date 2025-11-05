function apply_dracula_theme()
    vim.cmd [[colorscheme dracula]]

    require("rainbow-delimiters").enable()

    local highlight = {
        "DraculaRed",
        "DraculaYellow",
        "DraculaBlue",
        "DraculaOrange",
        "DraculaGreen",
        "DraculaViolet",
        "DraculaCyan",
    }

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "DraculaRed", { fg = "#FF5555" })
        vim.api.nvim_set_hl(0, "DraculaYellow", { fg = "#F1FA8C" })
        vim.api.nvim_set_hl(0, "DraculaBlue", { fg = "#D6ACFF" })
        vim.api.nvim_set_hl(0, "DraculaOrange", { fg = "#FFB86C" })
        vim.api.nvim_set_hl(0, "DraculaGreen", { fg = "#50fa7b" })
        vim.api.nvim_set_hl(0, "DraculaViolet", { fg = "#BD93F9" })
        vim.api.nvim_set_hl(0, "DraculaCyan", { fg = "#8BE9FD" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
end

return {
    "Mofiqul/dracula.nvim",
    config = function()
        local dracula = require("dracula")
        dracula.setup({
            show_end_of_buffer = true,
            transparent_bg = true,
            italic_comment = true,
        })
    end
}
